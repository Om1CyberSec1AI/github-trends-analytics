# Analyzing Trends in Open-Source Repositories on GitHub

End-to-end data analytics project using:
- **GitHub REST API** for data collection
- **Python** for ingestion, processing, exports
- **SQLite + SQL** for storage and querying
- **Power BI** for interactive dashboards

### Theme
**"Analyzing Trends in Open-Source Repositories on GitHub"**:
- Popular languages and language-by-stars
- Star growth trends (via stargazer events with timestamps)
- Contributor activity + commit frequency
- Issue resolution patterns (time-to-close, open/closed ratios)

---

## Project Highlights
✅ GitHub API pagination + retry  
✅ Rate limit handling (reads `X-RateLimit-Remaining` / `X-RateLimit-Reset`)  
✅ Beginner-friendly, modular Python (PEP8)  
✅ Normalized SQLite schema (repos, commits, issues, contributors, stars, languages)  
✅ SQL analytics + Power BI-ready CSV exports  

> Data fetch is intentionally capped to **100–500 records** to avoid API abuse.

---

## Quickstart

### 1) Clone & install
```bash
git clone https://github.com/your-username/github-open-source-trends.git
cd github-open-source-trends
python -m venv .venv
# Windows: .venv\Scripts\activate
# macOS/Linux: source .venv/bin/activate
pip install -r requirements.txt
