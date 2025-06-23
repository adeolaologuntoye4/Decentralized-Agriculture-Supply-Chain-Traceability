;; Supply Chain Manager Verification Contract
;; Manages and verifies supply chain participants

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_REGISTERED (err u101))
(define-constant ERR_NOT_FOUND (err u102))

;; Manager types
(define-constant MANAGER_FARMER u1)
(define-constant MANAGER_PROCESSOR u2)
(define-constant MANAGER_DISTRIBUTOR u3)
(define-constant MANAGER_RETAILER u4)

;; Data structures
(define-map managers
  { manager: principal }
  {
    manager-type: uint,
    name: (string-ascii 50),
    location: (string-ascii 100),
    verified: bool,
    registration-block: uint
  }
)

(define-map manager-stats
  { manager: principal }
  {
    products-handled: uint,
    certifications: uint,
    reputation-score: uint
  }
)

;; Register a new supply chain manager
(define-public (register-manager (manager-type uint) (name (string-ascii 50)) (location (string-ascii 100)))
  (let ((manager tx-sender))
    (asserts! (is-none (map-get? managers { manager: manager })) ERR_ALREADY_REGISTERED)
    (asserts! (and (>= manager-type u1) (<= manager-type u4)) (err u103))
    (map-set managers
      { manager: manager }
      {
        manager-type: manager-type,
        name: name,
        location: location,
        verified: false,
        registration-block: block-height
      }
    )
    (map-set manager-stats
      { manager: manager }
      {
        products-handled: u0,
        certifications: u0,
        reputation-score: u50
      }
    )
    (ok manager)
  )
)

;; Verify a manager (only contract owner)
(define-public (verify-manager (manager principal))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (match (map-get? managers { manager: manager })
      manager-data (begin
        (map-set managers
          { manager: manager }
          (merge manager-data { verified: true })
        )
        (ok true)
      )
      ERR_NOT_FOUND
    )
  )
)

;; Update manager reputation
(define-public (update-reputation (manager principal) (score uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (match (map-get? manager-stats { manager: manager })
      stats (begin
        (map-set manager-stats
          { manager: manager }
          (merge stats { reputation-score: score })
        )
        (ok true)
      )
      ERR_NOT_FOUND
    )
  )
)

;; Read-only functions
(define-read-only (get-manager (manager principal))
  (map-get? managers { manager: manager })
)

(define-read-only (get-manager-stats (manager principal))
  (map-get? manager-stats { manager: manager })
)

(define-read-only (is-verified-manager (manager principal))
  (match (map-get? managers { manager: manager })
    manager-data (get verified manager-data)
    false
  )
)
