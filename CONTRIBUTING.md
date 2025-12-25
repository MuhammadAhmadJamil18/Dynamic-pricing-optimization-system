# Contributing Guidelines

## Development Setup

### Backend

1. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Run tests:
```bash
pytest tests/
```

### Frontend

1. Navigate to frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Copy environment file:
```bash
cp .env.example .env
```

4. Start development server:
```bash
npm run dev
```

## Code Style

### Python
- Follow PEP 8 style guide
- Use type hints where possible
- Maximum line length: 88 characters (Black formatter)

### TypeScript/JavaScript
- Use ESLint and Prettier
- Follow React best practices
- Use functional components with hooks
- Maximum line length: 80 characters

## Testing

### Backend Tests
```bash
pytest tests/
pytest tests/ -v  # Verbose output
pytest tests/ --cov=src  # With coverage
```

### Frontend Tests
(Add when frontend testing is set up)

## Commit Messages

Use clear, descriptive commit messages:
- `feat: Add new feature`
- `fix: Fix bug`
- `docs: Update documentation`
- `refactor: Refactor code`
- `test: Add tests`

## Pull Request Process

1. Create a feature branch
2. Make your changes
3. Add tests if applicable
4. Ensure all tests pass
5. Update documentation if needed
6. Submit pull request with clear description

