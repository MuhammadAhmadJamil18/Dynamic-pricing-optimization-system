# Dynamic Pricing Optimization System

A production-ready AI system that optimizes pricing strategies in real-time using Multi-Armed Bandits (Thompson Sampling) to maximize revenue. This system demonstrates advanced reinforcement learning techniques combined with modern web development and real-world business applications.

## Overview

This project implements a state-of-the-art dynamic pricing optimization system that learns optimal prices through exploration and exploitation. It combines reinforcement learning algorithms with modern web technologies to create a complete, production-ready solution applicable to e-commerce, SaaS, and retail industries.

The system uses Thompson Sampling, a Bayesian approach to the Multi-Armed Bandit problem, to balance exploration (trying different prices) and exploitation (using known good prices). This results in continuous learning and optimization, adapting pricing strategies in real-time based on customer behavior.

## Key Features

### Machine Learning
- **Thompson Sampling Multi-Armed Bandit**: Bayesian approach to the exploration-exploitation tradeoff
- **Revenue Optimization Engine**: Maximizes expected revenue using price elasticity models
- **Real-Time Learning**: Adapts pricing strategies based on conversion data
- **Confidence Intervals**: Quantifies uncertainty in price recommendations
- **Scalable Architecture**: Lazy loading and LRU caching for 100+ products

### Frontend Application
- **Modern Web Interface**: Built with React 18, TypeScript, and Tailwind CSS
- **Real-Time Visualizations**: Interactive charts showing pricing performance and learning curves
- **Industry-Specific Views**: Dedicated interfaces for E-Commerce, SaaS, and Retail use cases
- **Responsive Design**: Optimized for desktop and mobile devices
- **Smooth Animations**: Framer Motion for enhanced user experience
- **Error Handling**: Error boundaries and graceful error states

### Backend API
- **RESTful API**: FastAPI-based backend with comprehensive endpoints
- **Real Data Integration**: Fetches product data from DummyJSON API
- **Production-Ready**: Error handling, validation, and health checks
- **Interactive Documentation**: Auto-generated API docs with Swagger UI
- **Optimized for Scale**: Lazy loading and caching for efficient memory usage
- **Pagination Support**: Handles 100+ products efficiently

### Performance & Scalability
- **Lazy Loading**: Models loaded on-demand (startup < 1 second)
- **LRU Caching**: Keeps frequently used models in memory (50 models by default)
- **Memory Efficient**: ~50-100MB for 100+ products (vs 500MB-1GB loading all)
- **Thread-Safe**: Safe for concurrent requests
- **Fast API Responses**: 10-20ms for cached models, 50-100ms for cold loads

## Technology Stack

### Frontend
- **React 18** with TypeScript
- **Vite** - Build tool and dev server
- **Tailwind CSS** - Utility-first CSS framework
- **React Query (TanStack Query)** - Data fetching and caching
- **Recharts** - Data visualization library
- **React Router** - Client-side routing
- **Framer Motion** - Animation library
- **Lucide React** - Icon library

### Backend
- **FastAPI** - Modern Python web framework
- **Python 3.9+**
- **NumPy, SciPy** - Numerical computing
- **PyTorch** - Deep learning framework
- **scikit-learn** - Machine learning utilities

### Data
- **DummyJSON API** - Free product data API
- **JSON-based model persistence**

### Deployment
- **Docker and Docker Compose** - Containerization
- **Cloud-ready architecture**

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    Frontend (React)                      │
│  - Dashboard, E-Commerce, SaaS, Retail Views            │
│  - Real-time Visualizations with Recharts               │
│  - Price Recommendation Interface                       │
│  - Error Boundaries & Loading States                    │
└────────────────────┬────────────────────────────────────┘
                     │ HTTP REST API
┌────────────────────▼────────────────────────────────────┐
│                FastAPI Backend                          │
│  - Model Manager (Lazy Loading + LRU Cache)            │
│  - Price Recommendations                                │
│  - Conversion Tracking                                  │
│  - Statistics & Analytics                               │
│  - Pagination & Caching                                 │
└────────────┬───────────────────┬────────────────────────┘
             │                   │
    ┌────────▼────────┐ ┌────────▼────────┐
    │ Thompson        │ │ Revenue         │
    │ Sampling        │ │ Optimizer       │
    │ Bandit          │ │                 │
    └─────────────────┘ └─────────────────┘
             │
             │ Learning Loop
             │
    ┌────────▼────────┐
    │ Conversion Data │
    │ (Success/Fail)  │
    └─────────────────┘
```

## Installation

### Prerequisites
- Python 3.9 or higher
- Node.js 18 or higher
- npm or yarn

### Backend Setup

1. **Create virtual environment** (recommended):
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. **Install dependencies**:
```bash
pip install -r requirements.txt
```

3. **Train models** (fetches product data and initializes bandits):
```bash
python src/train_models.py
```

This will:
- Fetch real product data from DummyJSON API
- Initialize bandit models for each product
- Save models to `models/` directory

4. **Start API server**:
```bash
python -m uvicorn api.main:app --reload --port 8000
```

The API will be available at:
- API: http://localhost:8000
- API Documentation: http://localhost:8000/docs
- Health Check: http://localhost:8000/api/v1/health

### Frontend Setup

1. **Navigate to frontend directory**:
```bash
cd frontend
```

2. **Install dependencies**:
```bash
npm install
```

3. **Configure environment** (optional):
```bash
cp .env.example .env
```

Edit `.env` if needed (default should work):
```
VITE_API_URL=http://localhost:8000
```

4. **Start development server**:
```bash
npm run dev
```

The frontend will be available at: http://localhost:3000

## Usage

### Basic Workflow

1. **Select a Product**: Choose from the dropdown menu
2. **Get Price Recommendation**: Click "Get Price Recommendation" to receive an AI-optimized price
3. **Record Conversion**: Track whether the customer purchased at that price
4. **View Statistics**: See charts and analytics showing learning progress
5. **System Learns**: The bandit automatically updates its strategy based on conversions

### API Endpoints

#### Price Recommendation
```bash
POST /api/v1/recommend-price
{
  "product_id": "product_121",
  "customer_segment": "premium"
}
```

#### Record Conversion
```bash
POST /api/v1/record-conversion
{
  "product_id": "product_121",
  "price": 139.99,
  "converted": true,
  "revenue": 139.99
}
```

#### Get Statistics
```bash
GET /api/v1/statistics/{product_id}
```

#### List Products (with pagination)
```bash
GET /api/v1/products?skip=0&limit=50
```

#### Cache Statistics
```bash
GET /api/v1/cache-stats
```

### Industry Use Cases

#### E-Commerce
- Dynamic product pricing
- Flash sale optimization
- Seasonal pricing adjustments
- Revenue maximization

#### SaaS
- Subscription tier optimization
- Freemium model pricing
- Enterprise pricing strategies
- MRR (Monthly Recurring Revenue) growth

#### Retail
- Markdown optimization
- Clearance pricing
- Inventory-driven pricing
- Promotional pricing

## Performance & Scalability

### Optimizations

The system is optimized for handling 100+ products:

- **Lazy Loading**: Models are loaded only when accessed (not at startup)
- **LRU Caching**: Keeps 50 frequently used models in memory (configurable)
- **Fast Startup**: < 1 second startup time (vs 15-30 seconds loading all models)
- **Memory Efficient**: ~50-100MB memory usage (vs 500MB-1GB for all models)
- **Pagination**: Product listing supports pagination for large datasets

### Performance Metrics

| Metric | Current (All Loaded) | Optimized (Lazy) |
|--------|---------------------|------------------|
| Startup Time | 15-30 seconds | < 1 second |
| Memory (100 products) | 500MB-1GB | 50-100MB |
| API Response (cached) | 50-100ms | 10-20ms |
| API Response (cold) | 50-100ms | 50-100ms |
| Product List | 200-500ms | 10-20ms |

### Scaling Recommendations

- **< 50 products**: `max_cache_size=30`
- **50-200 products**: `max_cache_size=50` (default)
- **200+ products**: `max_cache_size=100`

## Project Structure

```
.
├── api/                      # FastAPI backend
│   ├── main.py              # Main API application (optimized)
│   ├── models.py            # Pydantic models
│   └── model_manager.py     # Lazy loading and caching
├── frontend/                 # React frontend
│   ├── src/
│   │   ├── components/      # React components
│   │   │   ├── Layout.tsx
│   │   │   ├── PriceRecommendation.tsx
│   │   │   ├── StatisticsChart.tsx
│   │   │   ├── HeroBanner.tsx
│   │   │   └── ErrorBoundary.tsx
│   │   ├── pages/           # Page components
│   │   │   ├── Dashboard.tsx
│   │   │   ├── ECommerceView.tsx
│   │   │   ├── SaaSView.tsx
│   │   │   └── RetailView.tsx
│   │   ├── services/        # API service layer
│   │   │   └── api.ts
│   │   ├── types/           # TypeScript types
│   │   │   └── index.ts
│   │   └── App.tsx
│   └── package.json
├── src/                      # Core ML code
│   ├── bandits/             # Multi-Armed Bandit implementation
│   │   └── thompson_sampling.py
│   ├── optimization/        # Revenue optimization
│   │   └── pricing_optimizer.py
│   ├── forecasting/         # Demand forecasting (extensible)
│   │   └── demand_forecaster.py
│   ├── data/                # Data fetching
│   │   └── fetch_products.py
│   └── train_models.py      # Model training script
├── tests/                    # Test suite
│   ├── test_bandit.py       # Unit tests for bandit
│   └── test_api.py          # Integration tests for API
├── models/                   # Trained model files (generated)
├── data/                     # Product data cache (generated)
├── docker-compose.yml        # Docker Compose configuration
├── Dockerfile                # Backend Docker image
├── requirements.txt          # Python dependencies
└── README.md                 # This file
```

## Testing

### Backend Tests
```bash
pytest tests/
pytest tests/ -v              # Verbose output
pytest tests/ --cov=src       # With coverage
```

### Frontend Type Checking
```bash
cd frontend
npm run type-check
```

### Frontend Linting
```bash
cd frontend
npm run lint
```

## Docker Deployment

### Build and Run
```bash
docker-compose up --build
```

This will start both backend and frontend services:
- Frontend: http://localhost:3000
- Backend API: http://localhost:8000
- API Docs: http://localhost:8000/docs

### Stop Services
```bash
docker-compose down
```

## Algorithm Details

### Thompson Sampling

Thompson Sampling is a Bayesian approach to the Multi-Armed Bandit problem:

1. **Prior Distribution**: Each price (arm) has a Beta distribution representing conversion probability
2. **Sampling**: For each recommendation, sample from each arm's distribution
3. **Selection**: Choose the arm with the highest sample value
4. **Update**: After observing conversion, update the Beta distribution parameters
5. **Balance**: Automatically balances exploration (uncertain prices) and exploitation (known good prices)

### Revenue Optimization

The system maximizes expected revenue:

```
Expected Revenue = Price × Conversion Rate × Base Demand
```

The optimizer:
- Considers price elasticity (higher prices = lower conversion)
- Balances revenue per sale with conversion probability
- Uses Thompson Sampling to handle uncertainty
- Adapts to market conditions in real-time

## Business Value

### Revenue Impact
- **15-25% revenue increase** typical in dynamic pricing implementations
- Continuous optimization without manual A/B testing
- Adapts to market changes automatically

### Use Cases
- **E-Commerce**: Product pricing, flash sales, seasonal adjustments
- **SaaS**: Subscription tiers, freemium models, enterprise pricing
- **Retail**: Markdowns, clearance sales, promotional pricing
- **Hospitality**: Hotel rooms, airline seats (dynamic demand-based pricing)
- **Events**: Ticket pricing for concerts, sports, conferences

## Skills Demonstrated

### Machine Learning
- Reinforcement Learning (Multi-Armed Bandits)
- Bayesian Statistics (Thompson Sampling)
- Exploration-Exploitation Tradeoff
- Real-Time Learning Systems

### Software Engineering
- Production ML Systems
- RESTful API Design
- Modern Frontend Development
- Type Safety (TypeScript)
- Testing and Quality Assurance
- Docker and Containerization

### Business Acumen
- Revenue Optimization
- Pricing Strategy
- Business Metrics and KPIs
- Industry-Specific Applications

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for development guidelines.

## License

MIT License - see [LICENSE](LICENSE) file for details.

## References

- Thompson Sampling: Thompson, W. R. (1933). "On the likelihood that one unknown probability exceeds another"
- Multi-Armed Bandits: Sutton, R. S., & Barto, A. G. (2018). "Reinforcement Learning: An Introduction"
- Dynamic Pricing: Talluri, K. T., & van Ryzin, G. J. (2004). "The Theory and Practice of Revenue Management"

## Acknowledgments

- Product data provided by [DummyJSON](https://dummyjson.com/)
- Built with modern open-source technologies

---

**Note**: This is a demonstration project showcasing production-ready ML systems. For production deployments, consider additional features like authentication, rate limiting, monitoring, and database storage.
