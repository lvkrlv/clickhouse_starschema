
### 1. Deploy Clickhouse

```bash
echo "Deploy Clickhouse"
read -s pswrd

yc managed-clickhouse cluster create \
	--name otus-clickhouse- \
	--shard-name shard1 \
	--environment production \
	--network-name my-yc-network \
    --host type=clickhouse,zone-id=ru-central1-b,subnet-name=my-yc-subnet-b \
	--clickhouse-resource-preset s2.small \
	--clickhouse-disk-size 20 \
	--clickhouse-disk-type network-ssd \
	--database name=db1 \
	--datalens-access \
	--version 22.5 \
	--enable-sql-user-management \
	--service-account aje3sljsuve3ic95f6fd \
	--admin-password "$pswrd" 
```

### 2. Init dbt project

```bash
dbt init clickhouse_starschema
```

### 3. Install environment – dbt + clickhouse dependency

[title](Pipfile)

```txt
[packages]
dbt-core = "==1.0.4"
dbt-clickhouse = "==1.0.4"

[requires]
python_version = "3.9"
```

### 4. Configure project (dbt_project)


- [ ] Configure connection (profile)
- [ ] Prepare source data files (S3)
- [ ] Configure EXTERNAL TABLES (S3)
- [ ] Describe sources in .yml files
- [ ] Basic dbt models and configurations
- [ ] Code compilation + debugging
- [ ] Prepare STAR schema
- [ ] Querying results
- [ ] Testing & Documenting your project