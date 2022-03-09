
TOKEN="eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoxLCJ1aWQiOiJkYTkzMzAyMS0zZTc4LTQwYzMtYTc1MC02NTRlYjA3NjQzN2UiLCJlbWFpbCI6ImF4ZWxAZ29qb2IuY29tIiwicm9sZSI6MTAwLCJpYXQiOjE2NDY3NTM1ODMsImV4cCI6MTY1MTkzNzU4M30.A40l3eyBI9hWx5pqZNgHo39WKOGtIaPnqZRl_csJi3xj4h6E710eD26HY2B30JFFXhd4q0AsGT6Qp4hxS8DggQ"

COMPANY_IDS=(
522d6f0b-7853-4289-94c4-24df61d5e0f6
1e0913d2-cbfb-4fb3-93d6-0896ffde3cb8
e39d9a26-6b4c-4dbc-9266-01f2e42805c8
e548d5c7-69b9-427b-95ad-077d8b5605d1
c04b39ea-2d3a-46a3-a37b-16dfe406d946
febcfca8-276d-4970-b1ba-8365ca77f0e9
36b7c7c3-8a59-49fb-a542-f188590ddc8d
88d1c313-e296-44cf-8eb4-20797c3ed714
)

QUERY=""

for t in ${COMPANY_IDS[@]}; do
  QUERY="${QUERY}&companyIds[]=$t"
done;


curl --location -g "https://qa-hydro-stark-hris.gojob.tech/activity-statement/arhia?payMonth=2021-11$QUERY" --header "Authorization: Bearer $TOKEN" -vvv > ./hydro-fevrier.csv