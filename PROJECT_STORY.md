# Receipt Butler

**Tagline:** Your wallet's AI concierge.

**Elevator Pitch:**
Receipt Butler uses AI to turn receipts and banking screenshots into organized data. Automatically extract merchants, totals, and dates to eliminate manual entry and master your money effortlessly.

---

# Project Story

## Inspiration
We found ourselves with a camera roll full of temporary screenshots including banking transaction confirmations and digital receipts. These images were meant to be logged but were almost always forgotten. The core frustration was the inability to quickly find a specific transaction to see exactly whom we paid and when it happened. Traditional expense apps often require tedious manual entry or risky direct bank connections. We wanted a middle ground: a private and intelligent butler that could look at an image and understand the financial story behind it. We realized that AI was the only way to bridge this gap, transforming a static image into a searchable and understandable record of our spending.

## What it does
Receipt Butler is an AI-powered financial assistant that bridges the gap between static images and actionable data. Users simply upload receipts or banking screenshots, and the app uses advanced OCR and LLM-driven classification to extract:
* **Merchant and Parties:** Who was paid, or who sent the money.
* **Financial Details:** Exact amounts, currency, and transaction dates.
* **Categorization:** Smart tagging of expenses for categories like Food, Transport, and Utilities.
* **Searchable History:** A fully indexed database of your paper and digital trail.
* **Natural Language Querying:** A chat interface where you can ask, "How much did I spend on coffee last week?" and get instant answers based on your scanned data.

## How we built it
The project is built on a modern and high-performance stack:
* **Frontend:** **Flutter** provides a smooth and cross-platform experience for capturing and viewing data.
* **Backend:** **Serverpod (Dart)** handles the robust server-side logic and database management, allowing us to share types across the whole stack.
* **Intelligence:** We integrated **DeepSeek-R1** via OpenRouter to handle the complex task of understanding messy screenshots.
* **Infrastructure:** A PostgreSQL database stores the structured data, with a metadata hashing system for deduplication.

Mathematically, our deduplication and processing pipeline can be represented as:
$$f(I) = \text{Hash}(I) \times \text{LLM}(\text{OCR}(I))$$
Where $I$ is the input image, ensuring that $I_1 = I_2 \implies \text{Record}_1 = \text{Record}_2$.

## Challenges we ran into
One of the primary hurdles was the context window versus latency trade-off. Feeding hundreds of receipt records into an LLM for natural language querying can be slow. We initially faced timeout issues with standard API requests. We solved this by optimizing our Serverpod endpoints to handle long-running async tasks and increasing the timeout duration to 300 seconds for complex reasoning tasks. Additionally, handling the varied layouts of banking screenshots from different apps required precise prompt engineering to ensure the AI did not confuse the sender with the recipient.

## Accomplishments that we're proud of
We are particularly proud of the Deep Context Chat. Unlike many apps that only search by keyword, Receipt Butler allows you to talk to your data. By leveraging a large context window for the LLM, we can feed the assistant a user's entire recent history. This allows it to perform complex reasoning across multiple transactions in seconds, giving users instant clarity on their financial habits.

## What we learned
Building Receipt Butler taught us the power of Full-stack Dart. Using Serverpod allowed us to move incredibly fast by eliminating the translation layer between the mobile app and the database. We also learned that in the world of AI, the system prompt is just as important as the code itself. Refining how the AI interprets a blurry receipt or a complex bank confirmation was a major learning experience in prompt engineering.

## What's next for Receipt Butler
The future of the Butler is about more than just reading because it should also be predicting.
* **Budget Intelligence:** Predictive analytics to tell you if you are on track for the month.
* **Export Pipelines:** One-click exports to CSV, PDF, or direct sync with accounting software like Xero.
* **Auto-Fetch:** Integration with email inboxes to automatically process digital invoices as they arrive.
* **Offline Processing:** Exploring local on-device models to provide instant classification without ever sending data to the cloud.
