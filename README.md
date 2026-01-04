# rpa-cityhall

<div align="center">

![GitHub Release](https://img.shields.io/github/v/release/RP-Alpha/rpa-cityhall?style=for-the-badge&logo=github&color=blue)
![GitHub commits](https://img.shields.io/github/commits-since/RP-Alpha/rpa-cityhall/latest?style=for-the-badge&logo=git&color=green)
![License](https://img.shields.io/github/license/RP-Alpha/rpa-cityhall?style=for-the-badge&color=orange)
![Downloads](https://img.shields.io/github/downloads/RP-Alpha/rpa-cityhall/total?style=for-the-badge&logo=github&color=purple)

**Government Services Hub**

</div>

---

## ✨ Features

- 🪪 **Licenses** - ID Card, Driver's, Weapons, Hunting, Business
- 💼 **Job Center** - Apply for civilian employment
- 🏛️ **Government Jobs** - Access city services
- 🔐 **Permission System** - Staff and admin roles

---

## 📦 Dependencies

- `rpa-lib` (Required)

---

## 📥 Installation

1. Download the [latest release](https://github.com/RP-Alpha/rpa-cityhall/releases/latest)
2. Extract to your `resources` folder
3. Add to `server.cfg`:
   ```cfg
   ensure rpa-lib
   ensure rpa-cityhall
   ```

---

## ⚙️ Configuration

### Document Types

```lua
Config.Documents = {
    ['id_card'] = { label = 'ID Card', price = 50 },
    ['drivers_license'] = { label = "Driver's License", price = 250 },
    ['weapons_license'] = { label = 'Weapons License', price = 5000 },
    ['hunting_license'] = { label = 'Hunting License', price = 500 },
    ['business_license'] = { label = 'Business License', price = 10000 }
}
```

### Staff Permissions

```lua
Config.StaffPermissions = {
    groups = {},
    jobs = { 'cityhall' },
    minGrade = 0,
    onDuty = true
}
```

---

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

<div align="center">
  <sub>Built with ❤️ by <a href="https://github.com/RP-Alpha">RP-Alpha</a></sub>
</div>
