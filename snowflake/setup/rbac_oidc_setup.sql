-- 1. Create a specific role for Data Cloud access
CREATE OR REPLACE ROLE data_cloud_access_role;

-- 2. Create the OIDC Security Integration (Zero Copy)
-- Replace the ISSUER URL with your specific Salesforce Org URL
CREATE OR REPLACE SECURITY INTEGRATION sf_datacloud_oidc
  TYPE = EXTERNAL_OAUTH
  ENABLED = TRUE
  EXTERNAL_OAUTH_TYPE = 'SALESFORCE'
  EXTERNAL_OAUTH_ISSUER = 'https://[YOUR_DOMAIN].my.salesforce.com'
  EXTERNAL_OAUTH_JWS_KEYS_URL = 'https://[YOUR_DOMAIN].my.salesforce.com/idp/endpoint/jwks'
  EXTERNAL_OAUTH_TOKEN_USER_MAPPING_CLAIM = 'sub'
  EXTERNAL_OAUTH_ANY_ROLE_MODE = 'ENABLE';

-- 3. Grant usage
GRANT USAGE ON WAREHOUSE compute_wh TO ROLE data_cloud_access_role;