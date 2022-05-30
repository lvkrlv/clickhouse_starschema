
- [ ] Deploy Clickhouse

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

- [ ] Init dbt project
- [ ] Install environment – dbt + clickhouse dependency
- [ ] Configure project (dbt_project)
- [ ] Configure connection (profile)
- [ ] Prepare source data files (S3)
- [ ] Configure EXTERNAL TABLES (S3)
- [ ] Describe sources in .yml files
- [ ] Basic dbt models and configurations
- [ ] Code compilation + debugging
- [ ] Prepare STAR schema
- [ ] Querying results
- [ ] Testing & Documenting your project