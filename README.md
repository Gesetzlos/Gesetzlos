# Gesetzlos (Helix Framework / Plugin Suite)

Dieses Repository enthält eine modulare Helix-Schema-Struktur für dein mittelalterliches RP-MMO-Konzept.

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
- Zentrale PlayerData + Welt-Datenbanktabelle (SQLite über Helix DB)

## Architekturprinzip

- Alles als eigene Plugins, damit einzelne Systeme unabhängig aktiviert/deaktiviert werden können.
- Persistenz über `ix_characters`-Felder + `ix_gesetzlos_worlddata`.
- Serverlast minimiert durch zentrale Datenhaltung und einfache, cache-freundliche Strukturen.

## Nächste Schritte

1. UI Panels für Character Creation Wizard fertig bauen.
2. Item-Definitionen + Grid/DragDrop in Helix-Inventory integrieren.
3. Netzwerkprotokolle für Raid/Dungeon/Party ausbauen.
4. Permissions mit SAM vollständig mappen.
5. Quest- und World-State-Automation ausbauen.
