{% snapshot scd_raw_hosts %}
    {{
        config(
            target_schema="DEV",
            unique_key="id",
            strategy="timestamp",
            updated_at="updated_at",
            invalidate_hard_deletes=True,
        )
    }}
    select *
    from {{ source("airbnb", "hosts") }}
{% endsnapshot %}
