- view: source_headlines
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: author
    sql: ${TABLE}.author

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: fetcher
    sql: ${TABLE}.fetcher

  - dimension: name
    sql: ${TABLE}.name

  - dimension: name_hash
    sql: ${TABLE}.name_hash

  - dimension_group: published
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.published_at

  - dimension: section
    sql: ${TABLE}.section

  - dimension: source_id
    sql: ${TABLE}.source_id

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: url
    sql: ${TABLE}.url

  - measure: count
    type: count
    detail: detail*


  # ----- Detail ------
  sets:
    detail:
      - name
      - id
        # Counters for views that join 'source_headlines'
      - source_headline_fragments.count

