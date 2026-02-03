# Salesforce Data Cloud + Snowflake Zero Copy Integration

**Repo Owner:** Burakfenerci5  
**Focus:** Agentforce AI, Data Cloud, Snowflake Data Engineering

## 🎯 Project Overview
This repository demonstrates a **Zero Copy Architecture** connecting Salesforce Data Cloud to Snowflake. The goal is to power **Agentforce AI Agents** with real-time data without traditional ETL pipelines.

## 🏗️ Architecture


1. **Snowflake:** Hosts raw order and customer data.
2. **Data Cloud:** Connects via OIDC (External OAuth) to mount Snowflake tables as DMOs.
3. **Agentforce:** Uses RAG (Retrieval-Augmented Generation) to answer user queries based on the Snowflake data.

## 🚀 Repository Structure
- `/snowflake`: SQL scripts for OIDC setup and creating "Gold Layer" views.
- `/agentforce`: Prompt engineering templates for the Service Agent.
- `/data_cloud`: Configuration notes for the Data Share.

## 🛠️ Setup Instructions
1. Execute `rbac_oidc_setup.sql` in Snowflake to enable the integration.
2. Create a Data Share in Data Cloud pointing to the `customer_360_gold` view.
3. Configure your Agentforce Agent with the prompts found in `/agentforce/prompts`.