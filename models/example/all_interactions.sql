{{ config(
    materialized = 'table',
    indexes=[
      {'columns': ['date', 'organization_id', 'interaction_type'], 'unique': True},
    ]
)}}

WITH all_interactions AS(
SELECT
    organization_id,
    date,
    content_type AS interaction_type
  FROM
    "direct_6234_dce29"."affinity_interactions___meeting"
  UNION ALL
  SELECT
    organization_id,
    date,
    content_type AS interaction_type
  FROM
    "direct_6234_dce29"."affinity_interactions___call"
  UNION ALL
  SELECT
    organization_id,
    date,
    content_type AS interaction_type
  FROM
    "direct_6234_dce29"."affinity_interactions___chat_message"
  UNION ALL
  SELECT
    organization_id,
    date,
    interaction_type
  FROM
    "direct_6234_dce29"."affinity_interactions___email" 
)

select date::date AS date, organization_id, interaction_type, COUNT(*) AS interaction_count
from all_interactions
GROUP BY date, organization_id, interaction_type




