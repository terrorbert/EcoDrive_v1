# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140516011007) do

  create_table "achsgetriebe", primary_key: "id_ag", force: true do |t|
    t.string "hersteller",   limit: 100
    t.string "achsgetriebe", limit: 100
    t.string "uvg1",         limit: 50
    t.string "uvg2",         limit: 50
    t.string "schaltbar",    limit: 50
  end

  create_table "bm_dat", primary_key: "id_bm", force: true do |t|
    t.integer "id_md",                  default: 160, null: false
    t.integer "aktiv",                  default: 1,   null: false
    t.float   "km",                     default: 0.0
    t.string  "name",       limit: 100
    t.string  "ident",      limit: 100
    t.string  "box",        limit: 100
    t.string  "typ",        limit: 100
    t.string  "hersteller", limit: 100
    t.string  "model",      limit: 100
  end

  add_index "bm_dat", ["box"], name: "box", unique: true, using: :btree

  create_table "box", primary_key: "bo_nr", force: true do |t|
    t.integer "tipo",                default: 1, null: false
    t.integer "id_md",                           null: false
    t.string  "mandant", limit: 100
  end

  create_table "boxtyp", primary_key: "id_bt", force: true do |t|
    t.string  "short", limit: 10
    t.string  "long",  limit: 100
    t.integer "Tipo",  limit: 1
    t.string  "Info",  limit: 100
  end

  create_table "cache_ddr", force: true do |t|
    t.integer  "mdr"
    t.integer  "mmd"
    t.decimal  "w_distanz",                    precision: 10, scale: 3
    t.decimal  "w_verbrauch",                  precision: 10, scale: 3
    t.integer  "w_dauer"
    t.string   "mo_distanz",      limit: 200
    t.string   "mo_dauer",        limit: 200
    t.string   "mo_verbrauch",    limit: 200
    t.string   "mo_standzeit",    limit: 200
    t.string   "mo_refverbrauch", limit: 200
    t.string   "mo_refkf",        limit: 1000
    t.datetime "dt"
  end

  add_index "cache_ddr", ["mdr"], name: "mdr", unique: true, using: :btree

  create_table "cache_mo", force: true do |t|
    t.integer  "mmd"
    t.decimal  "w_distanz",                    precision: 10, scale: 3
    t.decimal  "w_verbrauch",                  precision: 10, scale: 3
    t.integer  "w_dauer"
    t.string   "mo_distanz",      limit: 200
    t.string   "mo_dauer",        limit: 200
    t.string   "mo_verbrauch",    limit: 200
    t.string   "mo_standzeit",    limit: 200
    t.string   "mo_refverbrauch", limit: 200
    t.string   "mo_refkf",        limit: 1000
    t.datetime "dt"
  end

  add_index "cache_mo", ["mmd"], name: "mmd", unique: true, using: :btree

  create_table "can", primary_key: "id_can", force: true do |t|
    t.string "Hersteller", limit: 100
    t.string "can",        limit: 100
  end

  create_table "car", primary_key: "id_c", force: true do |t|
    t.string  "bo_nr",        limit: 50
    t.integer "id_md"
    t.integer "id_ko",                                             default: 0,   null: false
    t.string  "kostenstelle", limit: 50
    t.integer "fk_ft"
    t.string  "fahrzeugtyp",  limit: 100
    t.integer "fk_ga"
    t.string  "getriebeart",  limit: 50
    t.integer "id_kt"
    t.string  "conductor",    limit: 50
    t.integer "fk_mv"
    t.string  "kennzeichen",  limit: 50,                           default: ""
    t.string  "ident",        limit: 50,                           default: ""
    t.decimal "laufleistung",             precision: 10, scale: 2, default: 0.0
    t.float   "refkf",                                             default: 0.0
    t.string  "baujahr",      limit: 50,                           default: ""
    t.string  "einbaudatum",  limit: 50
    t.string  "btc_last_pos", limit: 200
    t.integer "flagTipoVbr",  limit: 1,                            default: 0
  end

  create_table "eco", primary_key: "id_ec", force: true do |t|
    t.integer  "mfz",                                default: 0
    t.integer  "mmd",                                default: 0
    t.integer  "mdr",                                default: 0
    t.string   "Version",                 limit: 50, default: ""
    t.string   "fname",                   limit: 50, default: ""
    t.string   "MDD_GERAETENUMMER",       limit: 50, default: ""
    t.string   "MDD_FIRMWARE",            limit: 50, default: ""
    t.string   "ID_FELD",                 limit: 50, default: ""
    t.datetime "BEGINN"
    t.datetime "ENDE"
    t.string   "GR",                      limit: 50, default: ""
    t.float    "DISTANZ",                            default: 0.0
    t.integer  "DAUER",                              default: 0
    t.integer  "DAUER_H",                            default: 0
    t.integer  "D201",                               default: 0
    t.integer  "STANDZEIT",                          default: 0
    t.string   "LFD_NR",                  limit: 50, default: ""
    t.float    "KM_BEGINN",                          default: 0.0
    t.float    "KM_ENDE",                            default: 0.0
    t.float    "refvb",                              default: 0.0
    t.float    "refkf",                              default: 0.0
    t.float    "VERBRAUCH",                          default: 0.0
    t.float    "rdrvbr1",                            default: 0.0
    t.float    "rdrvbr2",                            default: 0.0
    t.float    "rdrvbr3",                            default: 0.0
    t.integer  "rdrvbr",                             default: 0
    t.float    "h1",                                 default: 0.0
    t.float    "h2",                                 default: 0.0
    t.integer  "tv",                                 default: 0
    t.integer  "tr",                                 default: 0
    t.float    "rasvbr",                             default: 0.0,    null: false
    t.float    "UMDREHUNGEN",                        default: 0.0
    t.integer  "TIME_ENGINE_OFF",                    default: 0
    t.integer  "TIME_ENGINE_OFF_H",                  default: 0
    t.integer  "TIME_ENGINE_OFF_H1",                 default: 0
    t.integer  "BREMSZEIT",                          default: 0
    t.integer  "BREMSDISTANZ",                       default: 0
    t.integer  "ZEIT_BREMSE_KUPPLUNG",               default: 0
    t.integer  "DISTANZ_BREMSE_KUPPLUNG",            default: 0
    t.float    "AVG_RPM",                            default: 0.0
    t.float    "AVG_RPM_ORG",                        default: 0.0
    t.float    "MAX_SPEED",                          default: 0.0
    t.float    "MAX_RPM",                            default: 0.0
    t.float    "MAX_RPM_ORG",                        default: 0.0
    t.float    "MAX_ACC",                            default: 0.0
    t.float    "MAX_DEC",                            default: 0.0
    t.float    "SPEED_LIMIT",                        default: 0.0
    t.float    "RPM_LIMIT",                          default: 0.0
    t.float    "ACC_LIMIT",                          default: 0.0
    t.float    "DEC_LIMIT",                          default: 0.0
    t.integer  "TIME_OVER_SPEED_LIMIT",              default: 0
    t.integer  "TIME_OVER_RPM_LIMIT",                default: 0
    t.integer  "TIME_OVER_ACC_LIMIT",                default: 0
    t.integer  "TIME_OVER_DEC_LIMIT",                default: 0
    t.integer  "WOT_ANZAHL",                         default: 0
    t.integer  "WOT_ZEIT",                           default: 0
    t.integer  "GEWICHT",                            default: 0
    t.integer  "SCHUBABSCHALTUNG_ZEIT",              default: 0
    t.integer  "SCHUBABSCHALTUNG_DIST",              default: 0
    t.integer  "RETARDER_ZEIT",                      default: 0
    t.integer  "RETARDER_DIST",                      default: 0
    t.integer  "ABS_ANZAHL",                         default: 0
    t.integer  "ESP_ANZAHL",                         default: 0
    t.integer  "ASR_ANZAHL",                         default: 0
    t.integer  "SCHALTVORGAENGE",                    default: 0
    t.integer  "STANDZEIT_H",                        default: 0
    t.integer  "GANG_0_ZEIT",                        default: 0
    t.integer  "GANG_1_ZEIT",                        default: 0
    t.integer  "GANG_2_ZEIT",                        default: 0
    t.integer  "GANG_3_ZEIT",                        default: 0
    t.integer  "GANG_4_ZEIT",                        default: 0
    t.integer  "GANG_5_ZEIT",                        default: 0
    t.integer  "GANG_6_ZEIT",                        default: 0
    t.integer  "GANG_7_ZEIT",                        default: 0
    t.integer  "GANG_8_ZEIT",                        default: 0
    t.integer  "GANG_9_ZEIT",                        default: 0
    t.integer  "GANG_10_ZEIT",                       default: 0
    t.integer  "GANG_11_ZEIT",                       default: 0
    t.integer  "GANG_12_ZEIT",                       default: 0
    t.integer  "GANG_13_ZEIT",                       default: 0
    t.integer  "GANG_14_ZEIT",                       default: 0
    t.integer  "GANG_15_ZEIT",                       default: 0
    t.integer  "GANG_16_ZEIT",                       default: 0
    t.integer  "GANG_0_DIST",                        default: 0
    t.integer  "GANG_1_DIST",                        default: 0
    t.integer  "GANG_2_DIST",                        default: 0
    t.integer  "GANG_3_DIST",                        default: 0
    t.integer  "GANG_4_DIST",                        default: 0
    t.integer  "GANG_5_DIST",                        default: 0
    t.integer  "GANG_6_DIST",                        default: 0
    t.integer  "GANG_7_DIST",                        default: 0
    t.integer  "GANG_8_DIST",                        default: 0
    t.integer  "GANG_9_DIST",                        default: 0
    t.integer  "GANG_10_DIST",                       default: 0
    t.integer  "GANG_11_DIST",                       default: 0
    t.string   "DAUER_LASTBETRIEB",       limit: 50, default: ""
    t.integer  "GANG_12_DIST",                       default: 0
    t.integer  "GANG_13_DIST",                       default: 0
    t.integer  "GANG_14_DIST",                       default: 0
    t.integer  "GANG_15_DIST",                       default: 0
    t.integer  "GANG_16_DIST",                       default: 0
    t.integer  "SPEED_KLASSE_1_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_1_ZEIT_H",              default: 0
    t.integer  "SPEED_KLASSE_2_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_3_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_4_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_5_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_6_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_7_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_8_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_1_DIST",                default: 0
    t.integer  "SPEED_KLASSE_2_DIST",                default: 0
    t.integer  "SPEED_KLASSE_3_DIST",                default: 0
    t.integer  "SPEED_KLASSE_4_DIST",                default: 0
    t.integer  "SPEED_KLASSE_5_DIST",                default: 0
    t.integer  "SPEED_KLASSE_6_DIST",                default: 0
    t.integer  "SPEED_KLASSE_7_DIST",                default: 0
    t.integer  "SPEED_KLASSE_8_DIST",                default: 0
    t.integer  "RPM_KLASSE_1_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_2_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_3_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_4_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_5_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_6_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_7_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_8_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_1_DIST",                  default: 0
    t.integer  "RPM_KLASSE_2_DIST",                  default: 0
    t.integer  "RPM_KLASSE_3_DIST",                  default: 0
    t.integer  "RPM_KLASSE_4_DIST",                  default: 0
    t.integer  "RPM_KLASSE_5_DIST",                  default: 0
    t.integer  "RPM_KLASSE_6_DIST",                  default: 0
    t.integer  "RPM_KLASSE_7_DIST",                  default: 0
    t.integer  "RPM_KLASSE_8_DIST",                  default: 0
    t.float    "ACC_DEC_KENNZAHL_MAX",               default: 0.0
    t.float    "ACC_DEC_KENNZAHL_MIN",               default: 0.0
    t.float    "ACC_DEC_KENNZAHL_AVG",               default: 0.0
    t.float    "MAX_DEC_1",                          default: 0.0
    t.float    "MAX_DEC_2",                          default: 0.0
    t.float    "MAX_DEC_3",                          default: 0.0
    t.float    "MAX_DEC_4",                          default: 0.0
    t.float    "MAX_DEC_5",                          default: 0.0
    t.float    "MAX_RPM_1",                          default: 0.0
    t.float    "MAX_RPM_2",                          default: 0.0
    t.float    "MAX_RPM_3",                          default: 0.0
    t.float    "MAX_RPM_4",                          default: 0.0
    t.float    "MAX_RPM_5",                          default: 0.0
    t.float    "AVG_RPM_UNDER_LIMIT",                default: 0.0
    t.float    "AVG_RPM_LIMIT",                      default: 0.0
    t.float    "ENG_ROUNDS_KM",                      default: 0.0
    t.float    "AVG_DEC_BRAKE",                      default: 0.0
    t.float    "ENG_ROUNDS_SPEED_LIMIT",             default: 0.0
    t.integer  "VALID_FLAG",              limit: 1,  default: 0
    t.integer  "VALIDFLAG",               limit: 1,  default: 0
    t.integer  "mpo",                                default: 0
    t.integer  "fmo",                                default: 0
    t.integer  "fkw",                                default: 0
    t.integer  "fda",                                default: 0
    t.integer  "fqt",                                default: 0
    t.string   "y",                       limit: 10, default: "2014"
    t.date     "imp"
  end

  add_index "eco", ["BEGINN"], name: "BEGINN", using: :btree
  add_index "eco", ["ENDE"], name: "ENDE", using: :btree
  add_index "eco", ["MDD_GERAETENUMMER", "fname", "BEGINN"], name: "MDD_GERAETENUMMER", unique: true, using: :btree
  add_index "eco", ["mdr"], name: "ind_mdr", using: :btree

  create_table "ecolutz", primary_key: "id_ec", force: true do |t|
    t.integer  "mfz",                                default: 0
    t.integer  "mmd",                                default: 0
    t.integer  "mdr",                                default: 0
    t.string   "Version",                 limit: 50, default: ""
    t.string   "fname",                   limit: 50, default: ""
    t.string   "MDD_GERAETENUMMER",       limit: 50, default: ""
    t.string   "MDD_FIRMWARE",            limit: 50, default: ""
    t.string   "ID_FELD",                 limit: 50, default: ""
    t.datetime "BEGINN"
    t.datetime "ENDE"
    t.string   "GR",                      limit: 50, default: ""
    t.float    "DISTANZ",                            default: 0.0
    t.integer  "DAUER",                              default: 0
    t.integer  "DAUER_H",                            default: 0
    t.integer  "D201",                               default: 0
    t.integer  "STANDZEIT",                          default: 0
    t.string   "LFD_NR",                  limit: 50, default: ""
    t.float    "KM_BEGINN",                          default: 0.0
    t.float    "KM_ENDE",                            default: 0.0
    t.float    "refvb",                              default: 0.0
    t.float    "refkf",                              default: 0.0
    t.float    "VERBRAUCH",                          default: 0.0
    t.float    "rdrvbr1",                            default: 0.0
    t.float    "rdrvbr2",                            default: 0.0
    t.float    "rdrvbr3",                            default: 0.0
    t.integer  "rdrvbr",                             default: 0
    t.float    "h1",                                 default: 0.0
    t.float    "h2",                                 default: 0.0
    t.integer  "tv",                                 default: 0
    t.integer  "tr",                                 default: 0
    t.float    "rasvbr",                             default: 0.0,    null: false
    t.float    "UMDREHUNGEN",                        default: 0.0
    t.integer  "TIME_ENGINE_OFF",                    default: 0
    t.integer  "TIME_ENGINE_OFF_H",                  default: 0
    t.integer  "TIME_ENGINE_OFF_H1",                 default: 0
    t.integer  "BREMSZEIT",                          default: 0
    t.integer  "BREMSDISTANZ",                       default: 0
    t.integer  "ZEIT_BREMSE_KUPPLUNG",               default: 0
    t.integer  "DISTANZ_BREMSE_KUPPLUNG",            default: 0
    t.float    "AVG_RPM",                            default: 0.0
    t.float    "AVG_RPM_ORG",                        default: 0.0
    t.float    "MAX_SPEED",                          default: 0.0
    t.float    "MAX_RPM",                            default: 0.0
    t.float    "MAX_RPM_ORG",                        default: 0.0
    t.float    "MAX_ACC",                            default: 0.0
    t.float    "MAX_DEC",                            default: 0.0
    t.float    "SPEED_LIMIT",                        default: 0.0
    t.float    "RPM_LIMIT",                          default: 0.0
    t.float    "ACC_LIMIT",                          default: 0.0
    t.float    "DEC_LIMIT",                          default: 0.0
    t.integer  "TIME_OVER_SPEED_LIMIT",              default: 0
    t.integer  "TIME_OVER_RPM_LIMIT",                default: 0
    t.integer  "TIME_OVER_ACC_LIMIT",                default: 0
    t.integer  "TIME_OVER_DEC_LIMIT",                default: 0
    t.integer  "WOT_ANZAHL",                         default: 0
    t.integer  "WOT_ZEIT",                           default: 0
    t.integer  "GEWICHT",                            default: 0
    t.integer  "SCHUBABSCHALTUNG_ZEIT",              default: 0
    t.integer  "SCHUBABSCHALTUNG_DIST",              default: 0
    t.integer  "RETARDER_ZEIT",                      default: 0
    t.integer  "RETARDER_DIST",                      default: 0
    t.integer  "ABS_ANZAHL",                         default: 0
    t.integer  "ESP_ANZAHL",                         default: 0
    t.integer  "ASR_ANZAHL",                         default: 0
    t.integer  "SCHALTVORGAENGE",                    default: 0
    t.integer  "STANDZEIT_H",                        default: 0
    t.integer  "GANG_0_ZEIT",                        default: 0
    t.integer  "GANG_1_ZEIT",                        default: 0
    t.integer  "GANG_2_ZEIT",                        default: 0
    t.integer  "GANG_3_ZEIT",                        default: 0
    t.integer  "GANG_4_ZEIT",                        default: 0
    t.integer  "GANG_5_ZEIT",                        default: 0
    t.integer  "GANG_6_ZEIT",                        default: 0
    t.integer  "GANG_7_ZEIT",                        default: 0
    t.integer  "GANG_8_ZEIT",                        default: 0
    t.integer  "GANG_9_ZEIT",                        default: 0
    t.integer  "GANG_10_ZEIT",                       default: 0
    t.integer  "GANG_11_ZEIT",                       default: 0
    t.integer  "GANG_12_ZEIT",                       default: 0
    t.integer  "GANG_13_ZEIT",                       default: 0
    t.integer  "GANG_14_ZEIT",                       default: 0
    t.integer  "GANG_15_ZEIT",                       default: 0
    t.integer  "GANG_16_ZEIT",                       default: 0
    t.integer  "GANG_0_DIST",                        default: 0
    t.integer  "GANG_1_DIST",                        default: 0
    t.integer  "GANG_2_DIST",                        default: 0
    t.integer  "GANG_3_DIST",                        default: 0
    t.integer  "GANG_4_DIST",                        default: 0
    t.integer  "GANG_5_DIST",                        default: 0
    t.integer  "GANG_6_DIST",                        default: 0
    t.integer  "GANG_7_DIST",                        default: 0
    t.integer  "GANG_8_DIST",                        default: 0
    t.integer  "GANG_9_DIST",                        default: 0
    t.integer  "GANG_10_DIST",                       default: 0
    t.integer  "GANG_11_DIST",                       default: 0
    t.string   "DAUER_LASTBETRIEB",       limit: 50, default: ""
    t.integer  "GANG_12_DIST",                       default: 0
    t.integer  "GANG_13_DIST",                       default: 0
    t.integer  "GANG_14_DIST",                       default: 0
    t.integer  "GANG_15_DIST",                       default: 0
    t.integer  "GANG_16_DIST",                       default: 0
    t.integer  "SPEED_KLASSE_1_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_1_ZEIT_H",              default: 0
    t.integer  "SPEED_KLASSE_2_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_3_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_4_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_5_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_6_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_7_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_8_ZEIT",                default: 0
    t.integer  "SPEED_KLASSE_1_DIST",                default: 0
    t.integer  "SPEED_KLASSE_2_DIST",                default: 0
    t.integer  "SPEED_KLASSE_3_DIST",                default: 0
    t.integer  "SPEED_KLASSE_4_DIST",                default: 0
    t.integer  "SPEED_KLASSE_5_DIST",                default: 0
    t.integer  "SPEED_KLASSE_6_DIST",                default: 0
    t.integer  "SPEED_KLASSE_7_DIST",                default: 0
    t.integer  "SPEED_KLASSE_8_DIST",                default: 0
    t.integer  "RPM_KLASSE_1_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_2_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_3_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_4_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_5_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_6_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_7_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_8_ZEIT",                  default: 0
    t.integer  "RPM_KLASSE_1_DIST",                  default: 0
    t.integer  "RPM_KLASSE_2_DIST",                  default: 0
    t.integer  "RPM_KLASSE_3_DIST",                  default: 0
    t.integer  "RPM_KLASSE_4_DIST",                  default: 0
    t.integer  "RPM_KLASSE_5_DIST",                  default: 0
    t.integer  "RPM_KLASSE_6_DIST",                  default: 0
    t.integer  "RPM_KLASSE_7_DIST",                  default: 0
    t.integer  "RPM_KLASSE_8_DIST",                  default: 0
    t.float    "ACC_DEC_KENNZAHL_MAX",               default: 0.0
    t.float    "ACC_DEC_KENNZAHL_MIN",               default: 0.0
    t.float    "ACC_DEC_KENNZAHL_AVG",               default: 0.0
    t.float    "MAX_DEC_1",                          default: 0.0
    t.float    "MAX_DEC_2",                          default: 0.0
    t.float    "MAX_DEC_3",                          default: 0.0
    t.float    "MAX_DEC_4",                          default: 0.0
    t.float    "MAX_DEC_5",                          default: 0.0
    t.float    "MAX_RPM_1",                          default: 0.0
    t.float    "MAX_RPM_2",                          default: 0.0
    t.float    "MAX_RPM_3",                          default: 0.0
    t.float    "MAX_RPM_4",                          default: 0.0
    t.float    "MAX_RPM_5",                          default: 0.0
    t.float    "AVG_RPM_UNDER_LIMIT",                default: 0.0
    t.float    "AVG_RPM_LIMIT",                      default: 0.0
    t.float    "ENG_ROUNDS_KM",                      default: 0.0
    t.float    "AVG_DEC_BRAKE",                      default: 0.0
    t.float    "ENG_ROUNDS_SPEED_LIMIT",             default: 0.0
    t.integer  "VALID_FLAG",              limit: 1,  default: 0
    t.integer  "VALIDFLAG",               limit: 1,  default: 0
    t.integer  "mpo",                                default: 0
    t.integer  "fmo",                                default: 0
    t.integer  "fkw",                                default: 0
    t.integer  "fda",                                default: 0
    t.integer  "fqt",                                default: 0
    t.string   "y",                       limit: 10, default: "2014"
    t.date     "imp"
  end

  add_index "ecolutz", ["BEGINN"], name: "BEGINN", using: :btree
  add_index "ecolutz", ["ENDE"], name: "ENDE", using: :btree
  add_index "ecolutz", ["MDD_GERAETENUMMER", "fname", "BEGINN"], name: "MDD_GERAETENUMMER", unique: true, using: :btree
  add_index "ecolutz", ["mdr"], name: "ind_mdr", using: :btree

  create_table "fahrzeugklasse", primary_key: "id_fk", force: true do |t|
    t.string "fahrzeugklasse", limit: 50
  end

  create_table "fahrzeugtyp", primary_key: "id_ft", force: true do |t|
    t.integer "id_fk",                   default: 0, null: false
    t.string  "fahrzeugtyp", limit: 200
  end

  create_table "flotte", primary_key: "id_fl", force: true do |t|
    t.integer "id_kd"
    t.string  "flotte", limit: 100
  end

  create_table "getriebeart", primary_key: "id_ga", force: true do |t|
    t.string "getriebeart", limit: 100
  end

  create_table "gps", primary_key: "id_gps", force: true do |t|
    t.integer  "fk_ec",                        default: 0
    t.string   "MDD_GERAETENUMMER", limit: 50
    t.string   "fname",             limit: 50, default: ""
    t.string   "fnstat",            limit: 50, default: ""
    t.string   "gpsb",              limit: 20
    t.string   "gpsl",              limit: 20
    t.string   "gpsv",              limit: 20
    t.string   "gpsh",              limit: 20
    t.string   "gpsw",              limit: 20
    t.string   "gpsp",              limit: 20
    t.date     "gpsd"
    t.datetime "gpsdt"
    t.time     "gpst"
    t.datetime "import"
    t.string   "lfdnr",             limit: 50, default: "", null: false
  end

  add_index "gps", ["MDD_GERAETENUMMER", "gpsd", "gpst"], name: "MDD_GERAETENUMMER_gpsd_gpst", unique: true, using: :btree
  add_index "gps", ["gpsd"], name: "gpsd", using: :btree

  create_table "hersteller", primary_key: "id_he", force: true do |t|
    t.string "hersteller", limit: 100
    t.string "short",      limit: 100
  end

  create_table "imp", primary_key: "impId", force: true do |t|
    t.string   "cnt",    limit: 30,  default: "0", null: false
    t.string   "gr",     limit: 30,  default: "0", null: false
    t.string   "can",    limit: 100,               null: false
    t.datetime "fecha",                            null: false
    t.datetime "import",                           null: false
  end

  add_index "imp", ["can", "fecha"], name: "can_fecha", using: :btree

  create_table "kontakt", primary_key: "id_kt", force: true do |t|
    t.integer "id_md"
    t.string  "name",     limit: 100
    t.string  "vorname",  limit: 100
    t.string  "kmandant", limit: 50
    t.string  "rfid",     limit: 50,  default: ""
    t.integer "funktion",             default: 1
    t.string  "tel1",     limit: 100, default: ""
    t.string  "tel2",     limit: 100
    t.string  "mobile1",  limit: 100
    t.string  "mobile2",  limit: 100
    t.string  "email1",   limit: 100
    t.string  "email2",   limit: 100
    t.string  "login",    limit: 100
    t.string  "pwd",      limit: 100
    t.string  "fl",       limit: 100
    t.string  "lang",     limit: 4,   default: "de"
  end

  create_table "kostenstelle", primary_key: "id_ko", force: true do |t|
    t.integer "id_md"
    t.string  "kostenstelle", limit: 100
  end

  create_table "kraftstoff", primary_key: "id_ks", force: true do |t|
    t.string  "kraftstoff", limit: 100
    t.decimal "co2_anteil",             precision: 10, scale: 2
  end

  create_table "kunde", primary_key: "id_kd", force: true do |t|
    t.integer "kfk",                  default: 2,      null: false
    t.integer "fk_kunde",             default: 0,      null: false
    t.string  "kunde",    limit: 100
    t.string  "pref",     limit: 100
    t.string  "grp",      limit: 10,  default: "de"
    t.string  "Land",     limit: 100, default: "de"
    t.string  "ort",      limit: 100
    t.string  "plz",      limit: 100
    t.string  "prp",      limit: 4,   default: "0000"
    t.string  "str",      limit: 100
    t.string  "internet", limit: 100
    t.string  "logo",     limit: 100
  end

  create_table "kv", force: true do |t|
    t.string  "k",   limit: 50
    t.integer "val"
  end

  create_table "livecounter", primary_key: "id_lc", force: true do |t|
    t.string "MDD_GERAETENUMMER",    limit: 50
    t.string "MDD_FIRMWARE",         limit: 50
    t.string "TRANSFER_ZEIT",        limit: 50
    t.string "AKTUALISIERUNG",       limit: 50, default: ""
    t.string "LAST_FIRMWARE_UPDATE", limit: 50
    t.string "LAST_CONFIG_CHANGE",   limit: 50, default: "", null: false
    t.date   "imp"
  end

  add_index "livecounter", ["MDD_GERAETENUMMER", "TRANSFER_ZEIT"], name: "MDD_GERAETENUMMER_TRANSFER_ZEIT", unique: true, using: :btree

  create_table "mbox", primary_key: "ID", force: true do |t|
    t.integer  "cnt"
    t.string   "box",  limit: 50,                null: false
    t.datetime "dti",                            null: false
    t.string   "land", limit: 5,  default: "de", null: false
  end

  add_index "mbox", ["box", "dti"], name: "box_dti", unique: true, using: :btree

  create_table "message", force: true do |t|
    t.string   "info1", limit: 500
    t.string   "info2", limit: 500
    t.string   "tipo",  limit: 20
    t.datetime "ts"
  end

  create_table "modellvariante", primary_key: "id_mv", force: true do |t|
    t.string  "modellvariante", limit: 100
    t.integer "id_he",                      default: 0, null: false
    t.string  "hersteller",     limit: 100
    t.integer "id_fk"
    t.string  "fahrzeugklasse", limit: 100
    t.integer "id_ks"
    t.string  "kraftstoff",     limit: 100
    t.string  "co2",            limit: 100
    t.string  "hubraum",        limit: 100
    t.string  "leistung",       limit: 100
  end

  create_table "mon1", primary_key: "id_m1", force: true do |t|
    t.integer  "active",  limit: 1,  default: 1
    t.string   "box",     limit: 50
    t.string   "fk_fz",   limit: 50
    t.string   "nr",      limit: 20, default: "0"
    t.string   "km",      limit: 20, default: "0"
    t.datetime "ts"
    t.datetime "ts_last",            default: '2000-01-01 00:00:00'
    t.integer  "counter",            default: 0,                     null: false
  end

  add_index "mon1", ["box", "fk_fz"], name: "box_fk_fz", unique: true, using: :btree

  create_table "mon1_err", primary_key: "id_m1e", force: true do |t|
    t.integer  "fk_m1"
    t.integer  "tipo"
    t.string   "erg",    limit: 256
    t.string   "nr",     limit: 50
    t.datetime "ts_err"
  end

  create_table "rank", primary_key: "rId", force: true do |t|
    t.integer "mId"
    t.string  "mo1",  limit: 256
    t.string  "mo2",  limit: 256
    t.string  "mo3",  limit: 256
    t.string  "mo4",  limit: 256
    t.string  "mo5",  limit: 256
    t.string  "mo6",  limit: 256
    t.string  "mo7",  limit: 256
    t.string  "mo8",  limit: 256
    t.string  "mo9",  limit: 256
    t.string  "mo10", limit: 256
    t.string  "mo11", limit: 256
    t.string  "mo12", limit: 256
  end

  create_table "rfid", primary_key: "rfid", force: true do |t|
    t.integer "fk_md", default: 185, null: false
  end

  create_table "rfids", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user", primary_key: "id_u", force: true do |t|
    t.integer "id_ac"
    t.integer "id_kd"
    t.integer "right"
    t.string  "login", limit: 50
    t.string  "pwd",   limit: 50
    t.string  "typ",   limit: 50
  end

end
