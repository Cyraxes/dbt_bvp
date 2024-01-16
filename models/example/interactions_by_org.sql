
-- Use the `ref` function to select from other models

select organization_id, SUM(interaction_count) AS interaction_count
from {{ ref('all_interactions') }}
GROUP BY organization_id
