# Quick Start Guide

Get this project running in 5 minutes!

## Step 1: Install Dependencies

```bash
pip install -r requirements.txt
```

## Step 2: Train Models

This will create bandits for demo products:

```bash
python src/train_models.py
```

Expected output:
```
Initializing Pricing Optimization System...
Found 3 products to initialize
Initializing bandit for Premium Headphones...
   Warming up bandit with 100 simulated conversions...
   Saved to models/product_1_bandit.json
   Best price: $119.99 (expected CR: 14.5%)
...
System initialization complete!
```

## Step 3: Start API

```bash
uvicorn api.main:app --reload --port 8000
```

API will be available at: http://localhost:8000
API docs: http://localhost:8000/docs

## Step 4: Start Frontend

Open a new terminal:

```bash
cd frontend
npm install
npm run dev
```

Frontend will open at: http://localhost:3000

## Step 5: Test It!

1. Open the web application (http://localhost:3000)
2. Select a product from the sidebar
3. Click "Get Recommendation" to get a price
4. Click "Record Conversion" to simulate a purchase
5. Watch the bandit learn and optimize!

## Alternative: Docker

```bash
# Build and run everything
docker-compose up --build

# Access:
# Frontend: http://localhost:3000
# API: http://localhost:8000
# API docs: http://localhost:8000/docs
```

## Test the API

### Get Price Recommendation

```bash
curl -X POST "http://localhost:8000/api/v1/recommend-price" \
     -H "Content-Type: application/json" \
     -d '{
       "product_id": "product_1",
       "customer_segment": "premium"
     }'
```

### Record Conversion

```bash
curl -X POST "http://localhost:8000/api/v1/record-conversion" \
     -H "Content-Type: application/json" \
     -d '{
       "product_id": "product_1",
       "price": 119.99,
       "converted": true,
       "revenue": 119.99
     }'
```

### Get Statistics

```bash
curl "http://localhost:8000/api/v1/statistics/product_1"
```

## Next Steps

1. **Customize Products**: Edit `src/train_models.py` to add your products
2. **Integrate Real Data**: Connect to your e-commerce platform
3. **Deploy**: Use Docker Compose or cloud services (AWS, GCP, Azure)
4. **Monitor**: Use the dashboard to track performance
5. **Iterate**: The bandit learns continuously from conversions!

## Troubleshooting

### API not connecting?
- Make sure API is running: `uvicorn api.main:app --reload`
- Check port 8000 is not in use

### Models not found?
- Run `python src/train_models.py` first
- Check `models/` directory exists

### Frontend errors?
- Make sure API is running first
- Check API_URL in frontend configuration (default: http://localhost:8000)
- Run `npm install` in frontend directory

---

You're ready to optimize prices and maximize revenue!
