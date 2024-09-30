This Task involves integrating the ok.surf API to fetch and display news articles. Please familiarise yourself with the following API endpoints:

1. `/news-section-names` (GET): Retrieves available news section names
2. `/news-feed` (GET): Fetches all available news articles across all sections
3. `/news-section` (POST): Retrieves news articles for specific section name(s)


Key Features
1. Home Feed
   - Implement a main feed displaying articles from all sections ( from /news-feed )
2. Category Navigation
   - Get category options using the `/news-section-names` endpoint and display them in the app
3. Article View
   - Implement a bookmark feature for local article saving
   - Article links should open in the device's default browser
