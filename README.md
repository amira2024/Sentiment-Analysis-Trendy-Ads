# Sentiment-Analysis-Trendy-Ads
Sentimental Analysis of users on popular company ad posts.
# Sentiment Analysis of Trendy Ads

## Project Overview
This project investigates the impact of viral trends on public engagement with company advertisements. By leveraging sentiment analysis and interaction metrics (likes, comments, shares), we evaluate the effectiveness of trendy ads compared to traditional ones across platforms like TikTok and Instagram.

## Tools and Technologies
- **Languages**: R
- **Libraries**: `syuzhet` (NRC sentiment analysis), `tidytext`
- **Data Collection**: Twitter, TikTok, and Instagram APIs; Apify scraping tools
- **Visualization**: Custom bar plots in R

## Key Features
- Scraped and cleaned data from social media platforms.
- Performed sentiment analysis to categorize public responses.
- Visualized engagement and sentiment trends with bar plots.

## Results
- Trendy ads generate higher engagement overall but elicit more neutral emotions compared to traditional ads, which invoke stronger sentiments (positive and negative).
- Average interactions: **Trendy ads (171,044)** vs. **Traditional ads (61,278.4)**.

## How to Run
1. Clone this repository.
2. Install dependencies (`syuzhet`, `tidytext`).
3. Run `starter_sentcode.R` for data cleaning and sentiment analysis.
4. Execute `visualization_script.R` to generate plots.


