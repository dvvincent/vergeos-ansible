# VergeOS Ansible Automation

This repository contains production-ready Ansible playbooks for managing virtual machines on VergeOS. It demonstrates how to automate VM lifecycle management, including importing legacy OVAs, configuring networks, and managing snapshots.

## Features

- **Production Import Workflow**: Handles legacy OVAs by automatically upgrading machine types (Q35) and drive interfaces (VirtIO-SCSI).
- **Simple VM Management**: Create, start, stop, and delete VMs.
- **Snapshot Management**: Automated backup workflows.
- **Infrastructure as Code**: Define your homelab or production environment in YAML.

## Prerequisites

- Ansible 2.9+
- VergeOS 4.x
- `vergeio.vergeos` Ansible Collection

## Setup

1. **Install Dependencies**:
   Run the setup script to serve as a quick start:
   ```bash
   chmod +x setup/install.sh
   ./setup/install.sh
   ```

2. **Configure Credentials**:
   Copy the example variables file and add your VergeOS credentials:
   ```bash
   cp group_vars/all.yml.example group_vars/all.yml
   nano group_vars/all.yml
   ```

## Usage

### 1. deploy-vm-production.yml (Recommended)
This is the gold standard for importing VMs. It handles machine type upgrades and drive interface fixes automatically.

```bash
ansible-playbook playbooks/deploy-vm-production.yml
```

**What it does:**
1. Imports OVA/qcow2 image.
2. Identifies the Machine ID (distinct from VM ID).
3. Upgrades Machine Type to `q35` (UEFI/Modern).
4. Removes incompatible IDE CD-ROMs.
5. Upgrades disks to `virtio-scsi`.
6. Configures network & cloud-init.
7. Powers on the VM.

### 2. manage-snapshots.yml
Create snapshots for your VMs.

```bash
ansible-playbook playbooks/manage-snapshots.yml -e "vm_name=prod-web-01"
```

## Documentation

See [BLOG-POST.md](BLOG-POST.md) for a detailed walkthrough of the journey to build these automations.

## License

MIT
