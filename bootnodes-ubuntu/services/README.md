1. Copy goldiam-bootnode or goldiam-v5-bootnode to /etc/init.d
2. Make sure the scripts are executable:
```
chmod +x /etc/init.d/goldiam-bootnode
chmod +x /etc/init.d/goldiam-v5-bootnode
```
3. Enable daemons with:
```
update-rc.d goldiam-bootnode defaults
update-rc.d goldiam-v5-bootnode defaults
```
4. Start services with:
```
service goldiam-bootnode start
service goldiam-v5-bootnode start
```
5. Check node log:
```
cat /var/log/goldiam-bootnode.log
cat /var/log/goldiam-v5-bootnode.log
```