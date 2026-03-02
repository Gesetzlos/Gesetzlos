# Gesetzlos (Helix Framework / Plugin Suite, GLua)

Dieses Repository enthält eine modulare **Helix-Schema-Struktur in GLua** für ein mittelalterliches RP-MMO.

## Wichtige Helix-Struktur

- `schema/sh_schema.lua` (Shared Schema-Metadaten + Includes)
- `schema/sv_schema.lua` (Server-Hooks)
- `schema/cl_schema.lua` (Client-Hooks)
- `schema/plugins/*` (modulare Systeme)

## Enthaltene Kernmodule

- Character Creation (Rasse, Königreich, Klasse, Attribut-Rolls)
- Progression & Skilltrees
- Inventory & Equipment (Basisstruktur)
- Procedural Loot Generator
- PvPvE-Zonen und Raid/Extraction-Grundlagen
- Dungeons/Party/Guild/Faction/Economy/Quests (modulare Basen)
- Immersion (Recognize/Name-Memory)
- Admin-Tools Hooks
- Jobs-System (RP-Rollen)
- HUD, Scoreboard, Deathscreen, Chat Channels
- Zentrale PlayerData + Welt-Datenbanktabelle (`ix_gesetzlos_worlddata`)

## Linux Root Server Hinweise

1. **Pfad prüfen:** Schema unter `garrysmod/gamemodes/<dein_schema>/schema/` deployen.
2. **Case-Sensitive Dateisystem:** Unter Linux sind Dateinamen exakt case-sensitive.
3. **Helix Core vollständig installieren:**
   - `gamemodes/helix/gamemode/config/sh_options.lua`
   - `gamemodes/helix/gamemode/config/sh_config.lua`
   müssen vorhanden sein (sonst startet Helix nicht korrekt).
4. **Logs beobachten:**
   - `garrysmod/console.log`
   - `garrysmod/data/helix/`
5. **Datenbank:** Standardmäßig SQLite (`sv.db`) über Helix `ix.db`.

## Architekturprinzip

- Alles als eigene Plugins, damit Systeme unabhängig aktiviert/deaktiviert werden können.
- Persistenz über `ix_characters`-Felder + `ix_gesetzlos_worlddata`.
- Performance-freundlich durch modulare, einfache Datenhaltung.
