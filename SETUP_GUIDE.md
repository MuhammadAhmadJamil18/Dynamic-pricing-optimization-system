# Setup Guide

Complete step-by-step guide to get the project running.

## Prerequisites

### Required Software

- **Python 3.9+**: [Download Python](https://www.python.org/downloads/)
- **Node.js 18+**: [Download Node.js](https://nodejs.org/)
- **npm or yarn**: Comes with Node.js
- **Git**: [Download Git](https://git-scm.com/downloads)

### Optional (for Docker)

- **Docker Desktop**: [Download Docker](https://www.docker.com/products/docker-desktop/)

## Initial Setup

### 1. Clone or Navigate to Project

```bash
cd "AI&ML project"
```

### 2. Backend Setup

#### Create Virtual Environment

**Windows:**
```bash
python -m venv venv
venv\Scripts\activate
```

**macOS/Linux:**
```bash
python3 -m venv venv
source venv/bin/activate
```

#### Install Dependencies

```bash
pip install -r requirements.txt
```

#### Fetch Product Data and Train Models

This will fetch real product data from DummyJSON API and initialize bandits:

```bash
python src/train_models.py
```

Expected output:
```
Initializing Pricing Optimization System...
Fetching products from DummyJSON API...
Found 5 products to initialize
...
System initialization complete!
```

#### Start Backend API

```bash
uvicorn api.main:app --reload --port 8000
```

The API will be available at:
- API: http://localhost:8000
- API Documentation: http://localhost:8000/docs
- Health Check: http://localhost:8000/api/v1/health

### 3. Frontend Setup

#### Navigate to Frontend Directory

```bash
cd frontend
```

#### Install Dependencies

```bash
npm install
```

This may take a few minutes on first run.

#### Configure Environment Variables

Copy the example environment file:

```bash
copy .env.example .env  # Windows
# or
cp .env.example .env    # macOS/Linux
```

Edit `.env` if needed (default should work for local development):
```
VITE_API_URL=http://localhost:8000
```

#### Start Frontend Development Server

```bash
npm run dev
```

The frontend will be available at: http://localhost:3000

### 4. Verify Installation

1. Open browser to http://localhost:3000
2. You should see the Pricing Optimization Dashboard
3. Select a product from the dropdown
4. Click "Get Price Recommendation"
5. View statistics and charts

## Docker Setup (Alternative)

If you prefer Docker:

### Build and Run

```bash
docker-compose up --build
```

This will start both backend and frontend services.

### Access Services

- Frontend: http://localhost:3000
- Backend API: http://localhost:8000
- API Docs: http://localhost:8000/docs

### Stop Services

```bash
docker-compose down
```

## Troubleshooting

### Backend Issues

**Port 8000 already in use:**
```bash
# Change port in command
uvicorn api.main:app --reload --port 8001
```

**Models not found:**
- Make sure you ran `python src/train_models.py` first
- Check that `models/` directory exists and contains `.json` files

**Import errors:**
- Verify virtual environment is activated
- Reinstall dependencies: `pip install -r requirements.txt`

### Frontend Issues

**Port 3000 already in use:**
- Vite will automatically suggest another port
- Or specify: `npm run dev -- --port 3001`

**API connection errors:**
- Verify backend API is running on port 8000
- Check `.env` file has correct `VITE_API_URL`
- Check browser console for CORS errors

**npm install fails:**
- Clear cache: `npm cache clean --force`
- Delete `node_modules` and `package-lock.json`, then reinstall
- Try using `yarn` instead of `npm`

**TypeScript errors:**
- Run type check: `npm run type-check`
- Ensure all dependencies are installed

### Data Fetching Issues

**DummyJSON API not responding:**
- Check internet connection
- The script will use cached data if available
- API might be temporarily unavailable (free tier limitations)

### Docker Issues

**Build fails:**
- Ensure Docker Desktop is running
- Try: `docker-compose build --no-cache`

**Port conflicts:**
- Edit `docker-compose.yml` to change port mappings
- Ensure ports 3000 and 8000 are not in use by other applications

## Development Workflow

### Running Tests

**Backend tests:**
```bash
pytest tests/
pytest tests/ -v  # Verbose output
```

**Run specific test file:**
```bash
pytest tests/test_bandit.py
```

### Code Quality

**Frontend linting:**
```bash
cd frontend
npm run lint
```

**Type checking:**
```bash
cd frontend
npm run type-check
```

### Making Changes

1. Create a feature branch
2. Make your changes
3. Test locally
4. Run tests
5. Commit with clear messages
6. Push to repository

## Production Build

### Frontend Production Build

```bash
cd frontend
npm run build
```

Build output will be in `frontend/dist/`

### Backend Production

For production, use a proper ASGI server:

```bash
uvicorn api.main:app --host 0.0.0.0 --port 8000 --workers 4
```

Or use Gunicorn:

```bash
pip install gunicorn
gunicorn api.main:app -w 4 -k uvicorn.workers.UvicornWorker
```

## Next Steps

- Explore the API documentation at http://localhost:8000/docs
- Try different products and see how pricing recommendations change
- Record conversions to see the bandit learn
- Check out the different industry views (E-Commerce, SaaS, Retail)

## Getting Help

- Check the main README.md for project overview
- Review API documentation at /docs endpoint
- Check test files for usage examples
- Review code comments for implementation details

