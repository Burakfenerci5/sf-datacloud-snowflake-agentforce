# Agentforce + Snowflake Intelligence: The Bypass Architecture

### Direct Intelligence. Zero Metadata Latency. No Semantic Overhead.

This project demonstrates a high-performance integration between **Salesforce Agentforce** and the **Snowflake AI Data Cloud**. By utilizing a "Bypass Architecture," this implementation allows Salesforce Agents to reach directly into **Snowflake Cortex AI** and **Document AI**, completely bypassing the need for Salesforce Data Cloud’s Semantic Layer, Search Indexes, or Intelligent Context.

---

## Strategic Value Proposition

In the current "Platform War" between Data and Engagement, this architecture establishes **Snowflake as the true Center of Gravity for Intelligence.**

* **Bypass the Semantic Layer:** Skip the complex and often latent process of creating Data Libraries and Search Indexes in Salesforce.
* **Direct Inference:** Access Snowflake **Cortex AI** functions natively from Agentforce for faster, more authoritative responses.
* **Unstructured Data Mastery:** Effortlessly process massive knowledge hubs (e.g., technical manuals or 32+ disparate unstructured sources) using Snowflake **Document AI** without syncing files to the CRM.
* **Cost Efficiency:** Reduce Salesforce Data Cloud credit consumption by centralizing RAG (Retrieval-Augmented Generation) and LLM evaluation inside Snowflake.

---

## Technical Architecture Overview



1.  **Engagement Layer:** Agentforce triggers an **Apex Invocable Action**.
2.  **The Bypass:** The Apex action skips Data Cloud’s internal search and calls the **Snowflake SQL API** directly.
3.  **Intelligence Layer:** Snowflake executes **Cortex AI** functions (Complete, Extract, Sentiment) directly on the raw data.
4.  **Inference:** The AI response is returned to Agentforce, grounded in the most current, un-synced enterprise data.

---

## Implementation Guide

### 1. Snowflake Environment Setup
* **Enable AI Functions:** Grant the necessary permissions to your service role:
  `GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE [YOUR_ROLE];`
* **Network Policy:** Ensure your Snowflake instance allows traffic from Salesforce IP ranges or utilizes PrivateLink.
* **Warehouse:** Assign a dedicated X-Small warehouse for API-driven inference to ensure low-latency responses.

### 2. Salesforce Connectivity
* **Named Credentials:** Setup a Named Credential in Salesforce (OAuth 2.0 recommended) pointing to your Snowflake account URL.
* **External Service:** Use the provided `Snowflake_SQL_API.json` (OpenAPI schema) to register the Snowflake `/api/v2/statements` endpoint.

### 3. The Apex "Bridge" (Bypass Logic)
Deploy the included `@InvocableMethod` Apex classes. Unlike standard implementations, these classes:
* Format the user prompt into a direct SQL query (e.g., `SELECT SNOWFLAKE.CORTEX.COMPLETE(...)`).
* Handle the asynchronous nature of the Snowflake SQL API.
* Return the grounded response directly to the Agentforce prompt template.

### 4. Agentforce Configuration
* **Prompt Template:** In **Prompt Builder**, create a new template.
* **Select Resource:** Instead of "Data Cloud Search Index," select your **Custom Apex Action**.
* **Grounding:** The agent now uses the live output from Snowflake as its primary "Source of Truth."

---

## Why Use This Project?

This repository is built for **Technical Architects** who need to solve the "Last Mile" problem of AI. It is inspired by real-world enterprise deployments, such as managing **32 unstructured data sources** to preserve institutional knowledge for retiring engineering teams (ExxonMobil Case Study).

---

## Requirements
* Salesforce Enterprise/Unlimited Edition with **Agentforce** enabled.
* Snowflake Account with **Cortex AI** and **SQL API** access.
* Salesforce **Data Cloud** (Optional; strictly for Zero-Copy data access if needed).

---

## Contributor
**Burak Fenercioglu**
*Technical Architect Director | Agentforce Legend | AI Strategy Specialist*
