WITH sessions AS (
  SELECT
    user_pseudo_id,
    (SELECT value.int_value FROM UNNEST(event_params)
     WHERE key = 'ga_session_id') AS session_id,
    event_name,
    (SELECT value.string_value FROM UNNEST(event_params)
     WHERE key = 'page_location') AS page
  FROM `project.dataset.events_*`
)

SELECT
  page,
  COUNT(DISTINCT CONCAT(user_pseudo_id, session_id)) AS sessions,
  COUNTIF(event_name = 'page_view') AS page_views
FROM sessions
WHERE page IS NOT NULL
GROUP BY page;
