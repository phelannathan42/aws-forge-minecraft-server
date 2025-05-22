# AWS Forge 1.19.2 Minecraft Server

This project sets up a modded Minecraft Forge 1.19.2 server on a free-tier AWS EC2 instance, with auto-backups to an S3 bucket and auto-start on reboot.

## 🚀 GitHub
Clone this repository:
```bash
git clone https://github.com/NathanPhelan/aws-forge-minecraft-server.git
cd aws-forge-minecraft-server
chmod +x setup.sh start-server.sh s3-backup.sh
./setup.sh
```

## 🛠 Setup Instructions

1. **Launch EC2** (t2.micro, Ubuntu 22.04)
2. **SSH into EC2**
3. **Run setup script (above)**
4. **Upload mods** to your S3 bucket and sync:
   ```bash
   aws s3 sync s3://your-bucket-name/mods mods/
   ```
5. **Start the server**:
   ```bash
   ./start-server.sh
   ```

6. **Enable Auto-Start on Boot**:
   ```bash
   sudo cp minecraft.service /etc/systemd/system/
   sudo systemctl daemon-reexec
   sudo systemctl enable minecraft
   sudo systemctl start minecraft
   ```

7. **Schedule Backups (Optional)**:
   ```bash
   crontab -e
   # Add: 0 */6 * * * /home/ubuntu/aws-forge-minecraft-server/s3-backup.sh
   ```

---

## 📁 Structure

- `setup.sh`: Installs Java, Forge, AWS CLI.
- `start-server.sh`: Launches the server.
- `s3-backup.sh`: Uploads world to S3.
- `minecraft.service`: systemd unit file for auto-start
- `mods/`: Folder for your mod `.jar` files.
