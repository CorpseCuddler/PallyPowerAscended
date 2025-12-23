_G.PallyPower = _G.PallyPower or {}
local PP = _G.PallyPower

PP.ClassRegistry = PP.ClassRegistry or {
	byToken = {},
	order = {},
	indexByToken = {},
	legacyOrder = {},
}

local function rebuildIndexes(registry)
	registry.indexByToken = {}
	for index, token in ipairs(registry.order) do
		registry.indexByToken[token] = index
	end
end

function PP:RebuildClassOrder()
	local registry = self.ClassRegistry
	local entries = {}
	for _, entry in pairs(registry.byToken) do
		entries[#entries + 1] = entry
	end

	table.sort(entries, function(a, b)
		local aOrder = a.sortOrder or 0
		local bOrder = b.sortOrder or 0
		if aOrder == bOrder then
			return a.token < b.token
		end
		return aOrder < bOrder
	end)

	registry.order = {}
	for _, entry in ipairs(entries) do
		registry.order[#registry.order + 1] = entry.token
	end

	rebuildIndexes(registry)
end

function PP:RegisterClass(token, displayName, iconPath, maxButtons, sortOrder)
	if not token or token == "" then return end

	local registry = self.ClassRegistry
	local entry = registry.byToken[token]
	local isNew = false

	if not entry then
		entry = { token = token }
		registry.byToken[token] = entry
		isNew = true
	end

	entry.name = displayName or entry.name or token
	entry.icon = iconPath or entry.icon
	entry.maxButtons = maxButtons or entry.maxButtons
	entry.sortOrder = sortOrder or entry.sortOrder

	if isNew and entry.sortOrder == nil then
		entry.sortOrder = #registry.order + 1
	end

	self:RebuildClassOrder()
	if self.OnClassRegistryUpdated then
		self:OnClassRegistryUpdated()
	end
end

function PP:GetClassInfo(token)
	return self.ClassRegistry.byToken[token]
end

function PP:GetClassOrder()
	return self.ClassRegistry.order
end

function PP:IterateClassRegistry()
	return ipairs(self.ClassRegistry.order)
end

function PP:GetClassIndex(token)
	return self.ClassRegistry.indexByToken[token]
end

function PP:GetClassTokenByIndex(index)
	return self.ClassRegistry.order[index]
end

function PP:GetClassMaxButtons(token)
	local entry = self:GetClassInfo(token)
	return (entry and entry.maxButtons) or PALLYPOWER_MAXPERCLASS
end

function PP:GetClassDisplayName(token)
	local entry = self:GetClassInfo(token)
	return (entry and entry.name) or token
end

function PP:GetClassIcon(token)
	local entry = self:GetClassInfo(token)
	return entry and entry.icon
end

function PP:GetLegacyClassToken(index)
	return self.ClassRegistry.legacyOrder[index]
end

local localized = _G.LOCALIZED_CLASS_NAMES_MALE or {}
local defaultMaxButtons = _G.PALLYPOWER_MAXPERCLASS or 8
local defaultClasses = {
	{ token = "WARRIOR", icon = "Interface\\AddOns\\PallyPower\\Icons\\Warrior" },
	{ token = "ROGUE", icon = "Interface\\AddOns\\PallyPower\\Icons\\Rogue" },
	{ token = "PRIEST", icon = "Interface\\AddOns\\PallyPower\\Icons\\Priest" },
	{ token = "DRUID", icon = "Interface\\AddOns\\PallyPower\\Icons\\Druid" },
	{ token = "PALADIN", icon = "Interface\\AddOns\\PallyPower\\Icons\\Paladin" },
	{ token = "HUNTER", icon = "Interface\\AddOns\\PallyPower\\Icons\\Hunter" },
	{ token = "MAGE", icon = "Interface\\AddOns\\PallyPower\\Icons\\Mage" },
	{ token = "WARLOCK", icon = "Interface\\AddOns\\PallyPower\\Icons\\Warlock" },
	{ token = "SHAMAN", icon = "Interface\\AddOns\\PallyPower\\Icons\\Shaman" },
	{ token = "DEATHKNIGHT", icon = "Interface\\AddOns\\PallyPower\\Icons\\DeathKnight" },
	{ token = "PET", icon = "Interface\\AddOns\\PallyPower\\Icons\\Pet", displayName = "Pet" },
}

for index, data in ipairs(defaultClasses) do
	local displayName = data.displayName or localized[data.token] or data.token
	PP:RegisterClass(data.token, displayName, data.icon, defaultMaxButtons, index)
	PP.ClassRegistry.legacyOrder[index] = data.token
end
