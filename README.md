# Decentralized Agriculture Supply Chain Traceability

A comprehensive blockchain-based system for tracking agricultural products from farm to consumer, ensuring transparency, quality, and authenticity throughout the supply chain.

## Overview

This system provides end-to-end traceability for agricultural products using Clarity smart contracts on the Stacks blockchain. It enables farmers, processors, distributors, retailers, and consumers to track and verify product information at every stage of the supply chain.

## Features

### 🌾 Complete Supply Chain Coverage
- **Farm Origin Tracking**: Record harvest details, farm location, and farming practices
- **Quality Certifications**: Manage organic, fair trade, and safety certifications
- **Distribution Monitoring**: Track product movement through the supply chain
- **Consumer Transparency**: Provide complete product information to end consumers

### 🔐 Verification & Security
- **Manager Verification**: Verify supply chain participants before they can interact with the system
- **Reputation System**: Track performance and reliability of supply chain managers
- **Immutable Records**: All transactions recorded on blockchain for permanent audit trail

### 📊 Transparency Features
- **Real-time Tracking**: Monitor product location and status
- **Quality History**: View all quality tests and certifications
- **Consumer Reviews**: Enable consumer feedback and ratings
- **Authenticity Verification**: Verify product authenticity and origin

## Smart Contracts

### 1. Supply Chain Manager (`supply-chain-manager.clar`)
Manages registration and verification of supply chain participants.

**Key Functions:**
- `register-manager`: Register as a supply chain participant
- `verify-manager`: Verify a manager (admin only)
- `update-reputation`: Update manager reputation score
- `is-verified-manager`: Check if a manager is verified

**Manager Types:**
- Farmer (1)
- Processor (2)
- Distributor (3)
- Retailer (4)

### 2. Origin Tracking (`origin-tracking.clar`)
Records the origin and initial details of agricultural products.

**Key Functions:**
- `create-product-origin`: Record product harvest and farm details
- `create-batch`: Create batch information for products
- `get-product-origin`: Retrieve product origin information
- `verify-origin`: Verify product origin against expected farmer

### 3. Quality Certification (`quality-certification.clar`)
Manages quality certifications and testing results.

**Key Functions:**
- `add-certification`: Add quality certification to a product
- `record-quality-test`: Record quality test results
- `revoke-certification`: Revoke an existing certification
- `is-certified`: Check if product has valid certification

**Certification Types:**
- Organic (1)
- Fair Trade (2)
- Quality Grade A (3)
- Safety Approved (4)

### 4. Distribution Monitoring (`distribution-monitoring.clar`)
Tracks product movement through the supply chain.

**Key Functions:**
- `create-shipment`: Create a new shipment record
- `confirm-arrival`: Confirm shipment arrival at destination
- `add-history-entry`: Add distribution history entry
- `track-product`: Get current product location

**Distribution Stages:**
- Farm (1)
- Processing (2)
- Warehouse (3)
- Distribution (4)
- Retail (5)

### 5. Consumer Transparency (`consumer-transparency.clar`)
Provides comprehensive product information to consumers.

**Key Functions:**
- `get-product-info`: Get complete product information
- `get-product-certifications`: Get all product certifications
- `add-rating`: Add consumer rating and review
- `calculate-transparency-score`: Calculate product transparency score
- `verify-product-authenticity`: Verify product authenticity

## Getting Started

### Prerequisites
- Clarinet CLI installed
- Stacks wallet for testing
- Node.js and npm for running tests

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd agriculture-supply-chain
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Deployment

1. Deploy contracts in order:
   \`\`\`bash
   clarinet deploy --testnet
   \`\`\`

2. Verify deployment:
   \`\`\`bash
   clarinet console
   \`\`\`

## Usage Examples

### 1. Register as a Farmer
\`\`\`clarity
(contract-call? .supply-chain-manager register-manager u1 "Green Valley Farm" "California, USA")
\`\`\`

### 2. Create Product Origin
\`\`\`clarity
(contract-call? .origin-tracking create-product-origin
"TOMATO-001"
"Green Valley Farm"
"California, USA"
"Organic Tomatoes"
u1640995200
u1000
true)
\`\`\`

### 3. Add Quality Certification
\`\`\`clarity
(contract-call? .quality-certification add-certification
"TOMATO-001"
u1
u1672531200
"Passed all organic standards"
"A+")
\`\`\`

### 4. Create Shipment
\`\`\`clarity
(contract-call? .distribution-monitoring create-shipment
"SHIP-001"
"TOMATO-001"
'SP2J6ZY48GV1EZ5V2V5RB9MP66SW86PYKKNRV9EJ7
u2
u500
u1641081600
"Temperature maintained 2-4°C")
\`\`\`

### 5. Get Product Information (Consumer)
\`\`\`clarity
(contract-call? .consumer-transparency get-product-info "TOMATO-001")
\`\`\`

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm test
\`\`\`

Test files cover:
- Contract deployment and initialization
- Manager registration and verification
- Product origin tracking
- Quality certification management
- Distribution monitoring
- Consumer transparency features

## API Reference

### Error Codes

| Code | Description |
|------|-------------|
| 100-199 | Supply Chain Manager errors |
| 200-299 | Origin Tracking errors |
| 300-399 | Quality Certification errors |
| 400-499 | Distribution Monitoring errors |
| 500-599 | Consumer Transparency errors |

### Data Structures

Detailed data structures for each contract are documented in the contract files.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions:
- Create an issue in the GitHub repository
- Contact the development team
- Check the documentation wiki

## Roadmap

- [ ] Mobile app integration
- [ ] IoT sensor integration
- [ ] Advanced analytics dashboard
- [ ] Multi-chain support
- [ ] API gateway for external integrations
  \`\`\`

```md project="Agriculture Supply Chain" file="PR_DETAILS.md" type="markdown"
# Pull Request: Decentralized Agriculture Supply Chain Traceability System

## Summary

This PR introduces a comprehensive decentralized agriculture supply chain traceability system built with Clarity smart contracts. The system provides end-to-end tracking of agricultural products from farm to consumer, ensuring transparency, quality verification, and authenticity throughout the supply chain.

## Changes Made

### 🆕 New Smart Contracts

1. **Supply Chain Manager Contract** (`supply-chain-manager.clar`)
   - Manager registration and verification system
   - Reputation tracking for supply chain participants
   - Role-based access control (Farmer, Processor, Distributor, Retailer)

2. **Origin Tracking Contract** (`origin-tracking.clar`)
   - Product origin recording with farm details
   - Batch information management
   - Harvest date and condition tracking
   - Organic certification status

3. **Quality Certification Contract** (`quality-certification.clar`)
   - Multiple certification types (Organic, Fair Trade, Quality Grade A, Safety)
   - Quality test recording and management
   - Certification expiry and revocation system
   - Test result documentation

4. **Distribution Monitoring Contract** (`distribution-monitoring.clar`)
   - Shipment creation and tracking
   - Multi-stage distribution monitoring
   - Temperature and condition logging
   - Real-time location updates

5. **Consumer Transparency Contract** (`consumer-transparency.clar`)
   - Complete product information aggregation
   - Consumer rating and review system
   - Transparency score calculation
   - Product authenticity verification

### 📋 Documentation

- **README.md**: Comprehensive documentation with usage examples
- **PR_DETAILS.md**: Detailed pull request information
- Complete API reference and error code documentation

### 🧪 Test Suite

- Comprehensive Vitest test suite covering all contracts
- Integration tests for cross-contract functionality
- Edge case and error condition testing
- Mock data and test scenarios

## Features Implemented

### Core Functionality
- ✅ Manager registration and verification
- ✅ Product origin tracking
- ✅ Quality certification management
- ✅ Distribution monitoring
- ✅ Consumer transparency features

### Security Features
- ✅ Role-based access control
- ✅ Manager verification requirements
- ✅ Immutable audit trail
- ✅ Data integrity validation

### User Experience
- ✅ Complete product information retrieval
- ✅ Real-time tracking capabilities
- ✅ Consumer rating system
- ✅ Transparency scoring

## Technical Details

### Contract Architecture
- **Modular Design**: Each contract handles a specific aspect of the supply chain
- **Inter-contract Communication**: Contracts reference each other for data validation
- **Data Integrity**: Comprehensive validation and error handling
- **Scalability**: Efficient data structures and query patterns

### Key Data Structures
- Manager profiles with verification status
- Product origin records with farm details
- Quality certifications with expiry dates
- Shipment tracking with status updates
- Consumer interactions and ratings

### Error Handling
- Comprehensive error code system (100-599 range)
- Descriptive error messages for debugging
- Input validation and authorization checks
- Graceful failure handling

## Testing Strategy

### Test Coverage
- **Unit Tests**: Individual contract function testing
- **Integration Tests**: Cross-contract interaction testing
- **Edge Cases**: Boundary condition and error scenario testing
- **Data Validation**: Input validation and constraint testing

### Test Files
- `supply-chain-manager.test.js`: Manager registration and verification
- `origin-tracking.test.js`: Product origin and batch management
- `quality-certification.test.js`: Certification and testing workflows
- `distribution-monitoring.test.js`: Shipment and tracking functionality
- `consumer-transparency.test.js`: Consumer features and transparency

## Usage Examples

### For Farmers
\`\`\`clarity
;; Register as farmer
(contract-call? .supply-chain-manager register-manager u1 "Green Valley Farm" "California")

;; Create product origin
(contract-call? .origin-tracking create-product-origin 
  "TOMATO-001" "Green Valley Farm" "California" "Organic Tomatoes" u1640995200 u1000 true)
\`\`\`

### For Quality Certifiers
\`\`\`clarity
;; Add organic certification
(contract-call? .quality-certification add-certification 
  "TOMATO-001" u1 u1672531200 "Passed organic standards" "A+")
\`\`\`

### For Distributors
\`\`\`clarity
;; Create shipment
(contract-call? .distribution-monitoring create-shipment 
  "SHIP-001" "TOMATO-001" 'SP2J6ZY48GV1EZ5V2V5RB9MP66SW86PYKKNRV9EJ7 u2 u500 u1641081600 "Temp 2-4°C")
\`\`\`

### For Consumers
\`\`\`clarity
;; Get complete product information
(contract-call? .consumer-transparency get-product-info "TOMATO-001")

;; Verify product authenticity
(contract-call? .consumer-transparency verify-product-authenticity "TOMATO-001")
\`\`\`

## Benefits

### For Supply Chain Participants
- **Transparency**: Complete visibility into product journey
- **Trust**: Verified participant network
- **Efficiency**: Streamlined tracking and documentation
- **Compliance**: Automated certification management

### For Consumers
- **Authenticity**: Verify product origin and quality
- **Information**: Access complete product history
- **Trust**: Transparent supply chain information
- **Choice**: Make informed purchasing decisions

### For Regulators
- **Audit Trail**: Immutable record of all transactions
- **Compliance**: Automated compliance checking
- **Traceability**: Quick identification of issues
- **Transparency**: Open access to supply chain data

## Future Enhancements

### Planned Features
- IoT sensor integration for real-time monitoring
- Mobile app for easy access and scanning
- Advanced analytics and reporting dashboard
- Multi-chain support for broader adoption
- API gateway for third-party integrations

### Scalability Improvements
- Batch processing for high-volume operations
- Caching layer for frequently accessed data
- Event-driven architecture for real-time updates
- Microservice architecture for component scaling

## Breaking Changes

This is a new feature implementation with no breaking changes to existing systems.

## Migration Guide

N/A - This is a new implementation.

## Checklist

- [x] All contracts implemented and tested
- [x] Comprehensive documentation provided
- [x] Test suite covers all functionality
- [x] Error handling implemented
- [x] Security considerations addressed
- [x] Performance optimizations applied
- [x] Code review completed
- [x] Integration testing passed

## Review Notes

### Code Quality
- All contracts follow Clarity best practices
- Comprehensive error handling and validation
- Clear and descriptive function and variable names
- Proper documentation and comments

### Security
- Role-based access control implemented
- Input validation on all public functions
- Authorization checks for sensitive operations
- Immutable audit trail for all transactions

### Performance
- Efficient data structures and access patterns
- Minimal gas usage optimization
- Scalable architecture design
- Optimized query patterns

## Deployment Instructions

1. Deploy contracts in the following order:
   - `supply-chain-manager.clar`
   - `origin-tracking.clar`
   - `quality-certification.clar`
   - `distribution-monitoring.clar`
   - `consumer-transparency.clar`

2. Verify contract deployment and initialization

3. Set up initial admin accounts and verified managers

4. Run integration tests to ensure proper functionality

## Support and Maintenance

- Comprehensive test suite for regression testing
- Clear documentation for future maintenance
- Modular architecture for easy updates
- Error logging and monitoring capabilities
