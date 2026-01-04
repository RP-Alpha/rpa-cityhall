Config = {}

-- ============================================
-- PERMISSION CONFIGURATION
-- ============================================

-- Admin permissions (can manage ID types, fees, etc.)
Config.AdminPermissions = {
    groups = { 'admin', 'god' },
    jobs = {},
    minGrade = 0,
    onDuty = false,
    convar = 'rpa:admins',
    resourceConvar = 'admin'
}

-- Staff permissions (employees who can issue licenses)
Config.StaffPermissions = {
    groups = {},
    jobs = { 'cityhall' },
    minGrade = 0,
    onDuty = true
}

-- ============================================
-- CITY HALL LOCATION
-- ============================================

Config.Location = vector3(-265.0, -963.0, 31.2) -- City Hall
Config.InteractDistance = 2.5

-- ============================================
-- DOCUMENT TYPES
-- ============================================

Config.Documents = {
    ['id_card'] = {
        label = 'ID Card',
        description = 'Government issued identification',
        price = 50,
        icon = 'fa-id-card',
        -- Permissions to acquire (nil = anyone)
        permissions = nil
    },
    ['drivers_license'] = {
        label = "Driver's License",
        description = 'License to operate motor vehicles',
        price = 250,
        icon = 'fa-car',
        permissions = nil
    },
    ['weapons_license'] = {
        label = 'Weapons License',
        description = 'License to carry firearms',
        price = 5000,
        icon = 'fa-gun',
        permissions = nil
    },
    ['hunting_license'] = {
        label = 'Hunting License',
        description = 'License to hunt wildlife',
        price = 500,
        icon = 'fa-deer',
        permissions = nil
    },
    ['business_license'] = {
        label = 'Business License',
        description = 'License to operate a business',
        price = 10000,
        icon = 'fa-briefcase',
        permissions = nil
    }
}

-- ============================================
-- JOB APPLICATIONS
-- ============================================

Config.JobApplications = {
    enabled = true,
    availableJobs = {
        ['trucker'] = {
            label = 'Trucker',
            description = 'Deliver goods across the city',
            requirements = nil -- No special requirements
        },
        ['taxi'] = {
            label = 'Taxi Driver',
            description = 'Transport passengers around the city',
            requirements = {
                documents = { 'drivers_license' }
            }
        },
        ['mechanic'] = {
            label = 'Mechanic',
            description = 'Repair and modify vehicles',
            requirements = {
                documents = { 'drivers_license' }
            }
        }
    }
}
