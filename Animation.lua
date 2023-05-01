local SCRIPT_VERSION = "1.4.3"

-- Auto Updater from https://github.com/hexarobi/stand-lua-auto-updater
local status, auto_updater = pcall(require, "auto-updater")
if not status then
    local auto_update_complete = nil util.toast("Installing auto-updater...", TOAST_ALL)
    async_http.init("raw.githubusercontent.com", "/hexarobi/stand-lua-auto-updater/main/auto-updater.lua",
        function(result, headers, status_code)
            local function parse_auto_update_result(result, headers, status_code)
                local error_prefix = "Error downloading auto-updater: "
                if status_code ~= 200 then util.toast(error_prefix..status_code, TOAST_ALL) return false end
                if not result or result == "" then util.toast(error_prefix.."Found empty file.", TOAST_ALL) return false end
                filesystem.mkdir(filesystem.scripts_dir() .. "lib")
                local file = io.open(filesystem.scripts_dir() .. "lib\\auto-updater.lua", "wb")
                if file == nil then util.toast(error_prefix.."Could not open file for writing.", TOAST_ALL) return false end
                file:write(result) file:close() util.toast("Successfully installed auto-updater lib", TOAST_ALL) return true
            end
            auto_update_complete = parse_auto_update_result(result, headers, status_code)
        end, function() util.toast("Error downloading auto-updater lib. Update failed to download.", TOAST_ALL) end)
    async_http.dispatch() local i = 1 while (auto_update_complete == nil and i < 40) do util.yield(250) i = i + 1 end
    if auto_update_complete == nil then error("Error downloading auto-updater lib. HTTP Request timeout") end
    auto_updater = require("auto-updater")
end
if auto_updater == true then error("Invalid auto-updater lib. Please delete your Stand/Lua Scripts/lib/auto-updater.lua and try again") end

-- Run auto-update
local auto_update_config = {
    source_url="https://raw.githubusercontent.com/Rachmad42/Emote-Stand-Lua/main/Animation.lua",
    script_relpath=SCRIPT_RELPATH
}

-- auto_updater.run_auto_update(auto_update_config)

util.require_natives(1651208000)
local Animation = {}


-- Original code for fivem https://github.com/andristum/dpemotes & https://github.com/TayMcKenzieNZ/rpemotes
-- Modified by Rachmad#7992


Animation.Dances = {
    ["dance"] = {
        "anim@amb@nightclub@dancers@podium_dancers@",
        "hi_dance_facedj_17_v2_male^5",
        "Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@",
        "high_center_down",
        "Dance 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@",
        "high_center",
        "Dance 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance4"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@",
        "high_center_up",
        "Dance 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance5"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_a@",
        "med_center",
        "Dance 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance6"] = {
        "misschinese2_crystalmazemcs1_cs",
        "dance_loop_tao",
        "Dance 6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance7"] = {
        "misschinese2_crystalmazemcs1_ig",
        "dance_loop_tao",
        "Dance 7",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance8"] = {
        "missfbi3_sniping",
        "dance_m_default",
        "Dance 8",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance9"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "med_center_up",
        "Dance 9",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancef"] = {
        "anim@amb@nightclub@dancers@solomun_entourage@",
        "mi_dance_facedj_17_v1_female^1",
        "Dance F",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancef2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center",
        "Dance F2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancef3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center_up",
        "Dance F3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancef4"] = {
        "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
        "hi_dance_facedj_09_v2_female^1",
        "Dance F4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancef5"] = {
        "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
        "hi_dance_facedj_09_v2_female^3",
        "Dance F5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancef6"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center_up",
        "Dance F6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclub"] = {
        "anim@amb@nightclub_island@dancers@beachdance@",
        "hi_idle_a_m03",
        "Dance Club",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubb"] = {
        "anim@amb@nightclub_island@dancers@beachdance@",
        "hi_idle_a_m05",
        "Dance Club 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubc"] = {
        "anim@amb@nightclub_island@dancers@beachdance@",
        "hi_idle_a_m02",
        "Dance Club 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubd"] = {
        "anim@amb@nightclub_island@dancers@beachdance@",
        "hi_idle_b_f01",
        "Dance Club 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclube"] = {
        "anim@amb@nightclub_island@dancers@club@",
        "hi_idle_a_f02",
        "Dance Club 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubf"] = {
        "anim@amb@nightclub_island@dancers@club@",
        "hi_idle_b_m03",
        "Dance Club 6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubg"] = {
        "anim@amb@nightclub_island@dancers@club@",
        "hi_idle_d_f01",
        "Dance Club 7",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubh"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "mi_dance_facedj_17_v2_male^4",
        "Dance Club 8 ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubi"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "mi_dance_prop_13_v1_male^3",
        "Dance Club 9 ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubj"] = {
        "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@",
        "mi_dance_crowd_13_v2_male^1",
        "Dance Club 10 ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubk"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "mi_dance_facedj_15_v2_male^4",
        "Dance Club 11 ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubl"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center_up",
        "Dance Club 12",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubm"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "hi_dance_facedj_hu_15_v2_male^5",
        "Dance Club 13 ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubn"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "hi_dance_facedj_hu_17_male^5",
        "Dance Club 14 ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubo"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_center",
        "Dance Club 15 ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubp"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_left_down",
        "Dance Club 16 ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancedrink"] = {
        "anim@amb@nightclub_island@dancers@beachdanceprop@",
        "mi_idle_c_m01",
        "Dance Drink (Beer)",
        AnimationOptions = {
            Prop = 'prop_beer_amopen',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.00,
                0.0,
                0.0,
                0.0,
                20.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancedrink2"] = {
        "anim@amb@nightclub_island@dancers@beachdanceprop@",
        "mi_loop_f1",
        "Dance Drink 2 (Wine)",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0900,
                0.0,
                0.0,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancedrink3"] = {
        "anim@amb@nightclub_island@dancers@beachdanceprop@",
        "mi_loop_m04",
        "Dance Drink 3 (Whiskey)",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_opaque_s',
            PropBone = 28422,
            PropPlacement = {
                -0.0100,
                0.00,
                0.0,
                0.0,
                0.0,
                10.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancedrink4"] = {
        "anim@amb@nightclub_island@dancers@beachdanceprops@male@",
        "mi_idle_b_m04",
        "Dance Drink 4 (Whiskey)",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_opaque_s',
            PropBone = 28422,
            PropPlacement = {
                -0.0100,
                0.00,
                0.0,
                0.0,
                0.0,
                10.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancedrink5"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "hi_dance_prop_09_v1_female^3",
        "Dance Drink 5 (Wine)",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0900,
                0.0,
                0.0,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancedrink6"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "hi_dance_prop_09_v1_male^3",
        "Dance Drink 6 (Beer)",
        AnimationOptions = {
            Prop = 'prop_beer_logopen',
            PropBone = 28422,
            PropPlacement = {
                0.0090,
                0.0010,
                -0.0310,
                180.0,
                180.0,
                -69.99
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancedrink7"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "hi_dance_prop_11_v1_female^3",
        "Dance Drink 7 (Wine)",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0900,
                0.0,
                0.0,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dancedrink8"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "hi_dance_prop_11_v1_female^1",
        "Dance Drink 8 (Wine)",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0900,
                0.0,
                0.0,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["danceslow2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "low_center",
        "Dance Slow 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceslow3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "low_center_down",
        "Dance Slow 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceslow4"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "low_center",
        "Dance Slow 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceupper"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "high_center",
        "Dance Upper",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["danceupper2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "high_center_up",
        "Dance Upper 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["danceshy"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@",
        "low_center",
        "Dance Shy",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceshy2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "low_center_down",
        "Dance Shy 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceslow"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@",
        "low_center",
        "Dance Slow",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly1"] = {
        "rcmnigel1bnmt_1b",
        "dance_loop_tyler",
        "Dance Silly 1",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly"] = {
        "special_ped@mountain_dancer@monologue_3@monologue_3a",
        "mnt_dnc_buttwag",
        "Dance Silly",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly2"] = {
        "move_clown@p_m_zero_idles@",
        "fidget_short_dance",
        "Dance Silly 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly3"] = {
        "move_clown@p_m_two_idles@",
        "fidget_short_dance",
        "Dance Silly 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly4"] = {
        "anim@amb@nightclub@lazlow@hi_podium@",
        "danceidle_hi_11_buttwiggle_b_laz",
        "Dance Silly 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly5"] = {
        "timetable@tracy@ig_5@idle_a",
        "idle_a",
        "Dance Silly 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly6"] = {
        "timetable@tracy@ig_8@idle_b",
        "idle_d",
        "Dance Silly 6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly7"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_b@",
        "med_center",
        "Dance Silly 7",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly8"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_b@",
        "high_center",
        "Dance Silly 8",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly9"] = {
        "anim@mp_player_intcelebrationfemale@the_woogie",
        "the_woogie",
        "Dance Silly 9",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceold"] = {
        "anim@mp_player_intupperuncle_disco",
        "idle_a",
        "Dance Old",
        AnimationOptions = {
            EmoteLoop = true,
            --			EmoteMoving = true,-- Removing the comment will allow for you to mix and match dance emotes, ie /e danceold and /e dance to control the bottom half of the body.
        }
    },
    ["danceglowstick"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_13_mi_hi_sexualgriding_laz",
        "Dance Glowsticks",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {
                0.0700,
                0.1400,
                0.0,
                -80.0,
                20.0
            },
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {
                0.0700,
                0.0900,
                0.0,
                -120.0,
                -20.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["danceglowstick2"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_12_mi_hi_bootyshake_laz",
        "Dance Glowsticks 2",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {
                0.0700,
                0.1400,
                0.0,
                -80.0,
                20.0
            },
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {
                0.0700,
                0.0900,
                0.0,
                -120.0,
                -20.0
            },
            EmoteLoop = true
        }
    },
    ["danceglowstick3"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Glowsticks 3",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {
                0.0700,
                0.1400,
                0.0,
                -80.0,
                20.0
            },
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {
                0.0700,
                0.0900,
                0.0,
                -120.0,
                -20.0
            },
            EmoteLoop = true
        }
    },
    ["dancehorse"] = {
        "anim@amb@nightclub@lazlow@hi_dancefloor@",
        "dancecrowd_li_15_handup_laz",
        "Dance Horse",
        AnimationOptions = {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["dancehorse2"] = {
        "anim@amb@nightclub@lazlow@hi_dancefloor@",
        "crowddance_hi_11_handup_laz",
        "Dance Horse 2",
        AnimationOptions = {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true
        }
    },
    ["dancehorse3"] = {
        "anim@amb@nightclub@lazlow@hi_dancefloor@",
        "dancecrowd_li_11_hu_shimmy_laz",
        "Dance Horse 3",
        AnimationOptions = {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true
        }
    },

    ["dj"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_dance_cntr_open_dix",
        "DJ",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["dj2"] = {
        "anim@amb@nightclub@djs@solomun@",
        "sol_idle_ctr_mid_a_sol",
        "DJ 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dj3"] = {
        "anim@amb@nightclub@djs@solomun@",
        "sol_dance_l_sol",
        "DJ 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dj4"] = {
        "anim@amb@nightclub@djs@black_madonna@",
        "dance_b_idle_a_blamadon",
        "DJ 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dj1"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_end_dix",
        "DJ 1",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dj5"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_idle_cntr_a_dix",
        "DJ 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dj6"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_idle_cntr_b_dix",
        "DJ 6",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dj7"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_idle_cntr_g_dix",
        "DJ 7",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dj8"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_idle_cntr_gb_dix",
        "DJ 8",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dj9"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_sync_cntr_j_dix",
        "DJ 9",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["twerk"] = {
        "switch@trevor@mocks_lapdance",
        "001443_01_trvs_28_idle_stripper",
        "Twerk",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lapdance"] = {
        "mp_safehouse",
        "lap_dance_girl",
        "Lapdance"
    },
    ["lapdance2"] = {
        "mini@strip_club@private_dance@idle",
        "priv_dance_idle",
        "Lapdance 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lapdance3"] = {
        "mini@strip_club@private_dance@part1",
        "priv_dance_p1",
        "Lapdance 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lapdance4"] = {
        "mini@strip_club@private_dance@part2",
        "priv_dance_p2",
        "Lapdance 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lapdance5"] = {
        "mini@strip_club@private_dance@part3",
        "priv_dance_p3",
        "Lapdance 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lapdance6"] = {
        "oddjobs@assassinate@multi@yachttarget@lapdance",
        "yacht_ld_f",
        "Lapdance 6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lapdancewith"] = {
        "mini@strip_club@lap_dance_2g@ld_2g_p3",
        "ld_2g_p3_s2",
        "Lapdance With",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lapdancewith2"] = {
        "mini@strip_club@lap_dance_2g@ld_2g_p2",
        "ld_2g_p2_s2",
        "Lapdance With2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lapdancewith3"] = {
        "mini@strip_club@lap_dance_2g@ld_2g_p1",
        "ld_2g_p1_s2",
        "Lapdance With3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lapchair"] = {
        "mini@strip_club@lap_dance@ld_girl_a_song_a_p1",
        "ld_girl_a_song_a_p1_f",
        "Lap Chair",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lapchair2"] = {
        "mini@strip_club@lap_dance@ld_girl_a_song_a_p2",
        "ld_girl_a_song_a_p2_f",
        "Lap Chair2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lapchair3"] = {
        "mini@strip_club@lap_dance@ld_girl_a_song_a_p3",
        "ld_girl_a_song_a_p3_f",
        "Lap Chair3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["salsa"] = {
        "anim@mp_player_intuppersalsa_roll",
        "idle_a",
        "Salso Roll",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancecrankdat"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_right_up",
        "Dance Crank Dat",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancecrankdat2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_right_down",
        "Dance Crank Dat 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancemonkey"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "high_center",
        "Monkey Dance  ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancemonkey2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "high_center_down",
        "Monkey Dance 2  ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancemonkey3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "med_center_down",
        "Monkey Dance 3  ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["boxdance"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@",
        "med_right_down",
        "Boxing Dance Solo  ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancehiphop"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_d@",
        "ped_a_dance_idle",
        "Hip Hop Dance ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancehiphop2"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_b@",
        "ped_a_dance_idle",
        "Hip Hop Dance 2 ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancehiphop3"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_a@",
        "ped_a_dance_idle",
        "Hip Hop Dance 3 ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancepride"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride A",
        AnimationOptions = {
            Prop = 'lilprideflag1', --- Rainbow
            PropBone = 18905,
            PropPlacement = {
                0.0900,
                0.0000,
                0.0300,
                -39.911,
                93.9166,
                -5.8062
            },
            SecondProp = 'lilprideflag1',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900,
                -0.0200,
                -0.0300,
                -90.2454,
                5.7068,
                -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
}




Animation.Emotes = {
    ["dispenser"] = {
        "mini@sprunk",
        "plyr_buy_drink_pt1",
        "Dispenser",
        AnimationOptions =
        {
            EmoteLoop = false
        }
    },
    ["beast"] = {
        "anim@mp_fm_event@intro",
        "beast_transform",
        "Beast",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 5000
        }
    },
    ["chill"] = {
        "switch@trevor@scares_tramp",
        "trev_scares_tramp_idle_tramp",
        "Chill",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 200,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["cloudgaze"] = {
        "switch@trevor@annoys_sunbathers",
        "trev_annoys_sunbathers_loop_girl",
        "Cloudgaze",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["cloudgaze2"] = {
        "switch@trevor@annoys_sunbathers",
        "trev_annoys_sunbathers_loop_guy",
        "Cloudgaze 2",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["prone"] = {
        "missfbi3_sniping",
        "prone_dave",
        "Prone",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["pullover"] = {
        "misscarsteal3pullover",
        "pull_over_right",
        "Pullover",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1300
        }
    },
    ["idle"] = {
        "anim@heists@heist_corona@team_idles@male_a",
        "idle",
        "Idle",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle8"] = {
        "amb@world_human_hang_out_street@male_b@idle_a",
        "idle_b",
        "Idle 8"
    },
    ["idle9"] = {
        "friends@fra@ig_1",
        "base_idle",
        "Idle 9",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle10"] = {
        "mp_move@prostitute@m@french",
        "idle",
        "Idle 10",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["idle11"] = {
        "random@countrysiderobbery",
        "idle_a",
        "Idle 11",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle2"] = {
        "anim@heists@heist_corona@team_idles@female_a",
        "idle",
        "Idle 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle3"] = {
        "anim@heists@humane_labs@finale@strip_club",
        "ped_b_celebrate_loop",
        "Idle 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle4"] = {
        "anim@mp_celebration@idles@female",
        "celebration_idle_f_a",
        "Idle 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle5"] = {
        "anim@mp_corona_idles@female_b@idle_a",
        "idle_a",
        "Idle 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle6"] = {
        "anim@mp_corona_idles@male_c@idle_a",
        "idle_a",
        "Idle 6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idle7"] = {
        "anim@mp_corona_idles@male_d@idle_a",
        "idle_a",
        "Idle 7",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idledrunk"] = {
        "random@drunk_driver_1",
        "drunk_driver_stand_loop_dd1",
        "Idle Drunk",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idledrunk2"] = {
        "random@drunk_driver_1",
        "drunk_driver_stand_loop_dd2",
        "Idle Drunk 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["idledrunk3"] = {
        "missarmenian2",
        "standing_idle_loop_drunk",
        "Idle Drunk 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["airguitar"] = {
        "anim@mp_player_intcelebrationfemale@air_guitar",
        "air_guitar",
        "Air Guitar",
    },
    ["airsynth"] = {
        "anim@mp_player_intcelebrationfemale@air_synth",
        "air_synth",
        "Air Synth"
    },
    ["argue"] = {
        "misscarsteal4@actor",
        "actor_berating_loop",
        "Argue",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["argue2"] = {
        "oddjobs@assassinate@vice@hooker",
        "argue_a",
        "Argue 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["argue3"] = {
        "missheistdockssetup1leadinoutig_1", 
        "lsdh_ig_1_argue_wade", 
        "Argue 3", 
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    }, 
    ["argue4"] = {
        "car_2_mcs_1-6", 
        "cs_devin_dual-6", 
        "Argue 4", 
        AnimationOptions = {            
            EmoteDuration = 6000,
            EmoteMoving = true
        }
    }, 
    ["argue5"] = {
        "anim@amb@casino@brawl@fights@argue@", 
        "arguement_loop_mp_m_brawler_01", 
        "Argue Angry 1", 
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    }, 
    ["argue6"] = {
        "anim@amb@casino@brawl@fights@argue@", 
        "arguement_loop_mp_m_brawler_02", 
        "Argue Angry 2", 
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },  
    ["bartender"] = {
        "anim@amb@clubhouse@bar@drink@idle_a",
        "idle_a_bartender",
        "Bartender",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["blowkiss"] = {
        "anim@mp_player_intcelebrationfemale@blow_kiss",
        "blow_kiss",
        "Blow Kiss"
    },
    ["blowkiss2"] = {
        "anim@mp_player_intselfieblow_kiss",
        "exit",
        "Blow Kiss 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["curtsy"] = {
        "anim@mp_player_intcelebrationpaired@f_f_sarcastic",
        "sarcastic_left",
        "Curtsy"
    },
    ["bringiton"] = {
        "misscommon@response",
        "bring_it_on",
        "Bring It On",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["comeatmebro"] = {
        "mini@triathlon",
        "want_some_of_this",
        "Come at me bro",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["cop2"] = {
        "anim@amb@nightclub@peds@",
        "rcmme_amanda1_stand_loop_cop",
        "Cop 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["cop3"] = {
        "amb@code_human_police_investigate@idle_a",
        "idle_b",
        "Cop 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["crossarms"] = {
        "amb@world_human_hang_out_street@female_arms_crossed@idle_a",
        "idle_a",
        "Crossarms",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["crossarms2"] = {
        "amb@world_human_hang_out_street@male_c@idle_a",
        "idle_b",
        "Crossarms 2",
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ["crossarms3"] = {
        "anim@heists@heist_corona@single_team",
        "single_team_loop_boss",
        "Crossarms 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["crossarms4"] = {
        "random@street_race",
        "_car_b_lookout",
        "Crossarms 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["crossarms5"] = {
        "anim@amb@nightclub@peds@",
        "rcmme_amanda1_stand_loop_cop",
        "Crossarms 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foldarms2"] = {
        "anim@amb@nightclub@peds@",
        "rcmme_amanda1_stand_loop_cop",
        "Fold Arms 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["crossarms6"] = {
        "random@shop_gunstore",
        "_idle",
        "Crossarms 6",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foldarms"] = {
        "anim@amb@business@bgen@bgen_no_work@",
        "stand_phone_phoneputdown_idle_nowork",
        "Fold Arms",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["crossarmsside"] = {
        "rcmnigel1a_band_groupies",
        "base_m2",
        "Crossarms Side",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["damn"] = {
        "gestures@m@standing@casual",
        "gesture_damn",
        "Damn",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["damn2"] = {
        "anim@am_hold_up@male",
        "shoplift_mid",
        "Damn 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["pointdown"] = {
        "gestures@f@standing@casual",
        "gesture_hand_down",
        "Point Down",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["surrender"] = {
        "random@arrests@busted",
        "idle_a",
        "Surrender",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "surrender_exit",
            ExitEmoteType = "Exits"
        }
    },
    ["surrender2"] = {
        "mp_bank_heist_1",
        "f_cower_02",
        "Surrender 2",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["surrender3"] = {
        "mp_bank_heist_1",
        "m_cower_01",
        "Surrender 3",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["surrender4"] = {
        "mp_bank_heist_1",
        "m_cower_02",
        "Surrender 4",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["surrender5"] = {
        "random@arrests",
        "kneeling_arrest_idle",
        "Surrender 5",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "surrender_exit",
            ExitEmoteType = "Exits"
        }
    },
    ["surrender6"] = {
        "rcmbarry",
        "m_cower_01",
        "Surrender 6",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["facepalm2"] = {
        "anim@mp_player_intcelebrationfemale@face_palm",
        "face_palm",
        "Facepalm 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ["facepalm"] = {
        "random@car_thief@agitated@idle_a",
        "agitated_idle_a",
        "Facepalm",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ["facepalm3"] = {
        "missminuteman_1ig_2",
        "tasered_2",
        "Facepalm 3",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ["facepalm4"] = {
        "anim@mp_player_intupperface_palm",
        "idle_a",
        "Facepalm 4",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["fallover"] = {
        "random@drunk_driver_1",
        "drunk_fall_over",
        "Fall Over"
    },
    ["fallover2"] = {
        "mp_suicide",
        "pistol",
        "Fall Over 2"
    },
    ["fallover3"] = {
        "mp_suicide",
        "pill",
        "Fall Over 3"
    },
    ["fallover4"] = {
        "friends@frf@ig_2",
        "knockout_plyr",
        "Fall Over 4"
    },
    ["fallover5"] = {
        "anim@gangops@hostage@",
        "victim_fail",
        "Fall Over 5"
    },
    ["fallasleep"] = {
        "mp_sleep",
        "sleep_loop",
        "Fall Asleep",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["fightme"] = {
        "anim@deathmatch_intros@unarmed",
        "intro_male_unarmed_c",
        "Fight Me"
    },
    ["fightme2"] = {
        "anim@deathmatch_intros@unarmed",
        "intro_male_unarmed_e",
        "Fight Me 2"
    },
    ["finger"] = {
        "anim@mp_player_intselfiethe_bird",
        "idle_a",
        "Finger",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["finger2"] = {
        "anim@mp_player_intupperfinger",
        "idle_a_fp",
        "Finger 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["handshake"] = {
        "mp_ped_interaction",
        "handshake_guy_a",
        "Handshake",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["handshake2"] = {
        "mp_ped_interaction",
        "handshake_guy_b",
        "Handshake 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["wait"] = {
        "random@shop_tattoo",
        "_idle_a",
        "Wait",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait2"] = {
        "missbigscore2aig_3",
        "wait_for_van_c",
        "Wait 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait3"] = {
        "amb@world_human_hang_out_street@female_hold_arm@idle_a",
        "idle_a",
        "Wait 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait4"] = {
        "amb@world_human_hang_out_street@Female_arm_side@idle_a",
        "idle_a",
        "Wait 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait5"] = {
        "missclothing",
        "idle_storeclerk",
        "Wait 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait6"] = {
        "timetable@amanda@ig_2",
        "ig_2_base_amanda",
        "Wait 6",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait7"] = {
        "rcmnigel1cnmt_1c",
        "base",
        "Wait 7",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait8"] = {
        "rcmjosh1",
        "idle",
        "Wait 8",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait9"] = {
        "rcmjosh2",
        "josh_2_intp1_base",
        "Wait 9",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait10"] = {
        "timetable@amanda@ig_3",
        "ig_3_base_tracy",
        "Wait 10",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait11"] = {
        "misshair_shop@hair_dressers",
        "keeper_base",
        "Wait 11",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait12"] = {
        "rcmjosh1",
        "keeper_base",
        "Wait 12",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wait13"] = {
        "rcmnigel1a",
        "base",
        "Wait 13",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["hiking"] = {
        "move_m@hiking",
        "idle",
        "Hiking",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["hugme"] = {
        "mp_ped_interaction",
        "kisses_guy_a",
        "Hug Me"
    },
    ["hugme2"] = {
        "mp_ped_interaction",
        "kisses_guy_b",
        "Hug Me 2"
    },
    ["inspect"] = {
        "random@train_tracks",
        "idle_e",
        "Inspect"
    },
    ["jazzhands"] = {
        "anim@mp_player_intcelebrationfemale@jazz_hands",
        "jazz_hands",
        "Jazzhands",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 6000
        }
    },
    ["jog2"] = {
        "amb@world_human_jog_standing@male@idle_a",
        "idle_a",
        "Jog 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jog3"] = {
        "amb@world_human_jog_standing@female@idle_a",
        "idle_a",
        "Jog 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jog4"] = {
        "amb@world_human_power_walker@female@idle_a",
        "idle_a",
        "Jog 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jog5"] = {
        "move_m@joy@a",
        "walk",
        "Jog 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jumpingjacks"] = {
        "timetable@reunited@ig_2",
        "jimmy_getknocked",
        "Jumping Jacks",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["kneel2"] = {
        "rcmextreme3",
        "idle",
        "Kneel 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["kneel3"] = {
        "amb@world_human_bum_wash@male@low@idle_a",
        "idle_a",
        "Kneel 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["knock"] = {
        "timetable@jimmy@doorknock@",
        "knockdoor_idle",
        "Knock",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["knock2"] = {
        "missheistfbi3b_ig7",
        "lift_fibagent_loop",
        "Knock 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["knucklecrunch"] = {
        "anim@mp_player_intcelebrationfemale@knuckle_crunch",
        "knuckle_crunch",
        "Knuckle Crunch",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lean2"] = {
        "amb@world_human_leaning@female@wall@back@hand_up@idle_a",
        "idle_a",
        "Lean 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lean3"] = {
        "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a",
        "idle_a",
        "Lean 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lean4"] = {
        "amb@world_human_leaning@male@wall@back@foot_up@idle_a",
        "idle_a",
        "Lean 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lean5"] = {
        "amb@world_human_leaning@male@wall@back@hands_together@idle_b",
        "idle_b",
        "Lean 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["leanflirt"] = {
        "random@street_race",
        "_car_a_flirt_girl",
        "Lean Flirt",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["leanbar2"] = {
        "amb@prop_human_bum_shopping_cart@male@idle_a",
        "idle_c",
        "Lean Bar 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["leanbar3"] = {
        "anim@amb@nightclub@lazlow@ig1_vip@",
        "clubvip_base_laz",
        "Lean Bar 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["leanbar4"] = {
        "anim@heists@prison_heist",
        "ped_b_loop_a",
        "Lean Bar 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["leanhigh"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_one",
        "Lean High",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanhigh2"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_two",
        "Lean High 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanside"] = {
        "timetable@mime@01_gc",
        "idle_a",
        "Leanside",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanside2"] = {
        "misscarstealfinale",
        "packer_idle_1_trevor",
        "Leanside 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanside3"] = {
        "misscarstealfinalecar_5_ig_1",
        "waitloop_lamar",
        "Leanside 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanside4"] = {
        "misscarstealfinalecar_5_ig_1",
        "waitloop_lamar",
        "Leanside 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["leanside5"] = {
        "rcmjosh2",
        "josh_2_intp1_base",
        "Leanside 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["leanplan"] = {
        "anim@amb@board_room@diagram_blueprints@",
        "idle_01_amy_skater_01",
        "Lean On Table",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 200,
            ExitEmote = "offtable",
            ExitEmoteType = "Exits"
        }
    },
    ["me"] = {
        "gestures@f@standing@casual",
        "gesture_me_hard",
        "Me",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["mechanic"] = {
        "mini@repair",
        "fixing_a_ped",
        "Mechanic",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["mechanic2"] = {
        "mini@repair",
        "fixing_a_player",
        "Mechanic 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["mechanic3"] = {
        "amb@world_human_vehicle_mechanic@male@base",
        "base",
        "Mechanic 3",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["mechanic4"] = {
        "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        "machinic_loop_mechandplayer",
        "Mechanic 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["mechanic5"] = {
        "amb@prop_human_movie_bulb@idle_a",
        "idle_b",
        "Mechanic 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["medic2"] = {
        "amb@medic@standing@tendtodead@base",
        "base",
        "Medic 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["meditate"] = {
        "rcmcollect_paperleadinout@",
        "meditiate_idle",
        "Meditiate",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "meditateup",
            ExitEmoteType = "Exits"
        }
    },
    ["meditate2"] = {
        "rcmepsilonism3",
        "ep_3_rcm_marnie_meditating",
        "Meditiate 2",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "meditateup",
            ExitEmoteType = "Exits"
        }
    },
    ["meditate3"] = {
        "rcmepsilonism3",
        "base_loop",
        "Meditiate 3",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "meditateup",
            ExitEmoteType = "Exits"
        }
    },
    ["metal"] = {
        "anim@mp_player_intincarrockstd@ps@",
        "idle_a",
        "Metal",
        AnimationOptions = {
            -- CHANGE ME
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["no"] = {
        "anim@heists@ornate_bank@chat_manager",
        "fail",
        "No",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["no2"] = {
        "mp_player_int_upper_nod",
        "mp_player_int_nod_no",
        "No 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["nosepick"] = {
        "anim@mp_player_intcelebrationfemale@nose_pick",
        "nose_pick",
        "Nose Pick",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["noway"] = {
        "gestures@m@standing@casual",
        "gesture_no_way",
        "No Way",
        AnimationOptions = {
            EmoteDuration = 1500,
            EmoteMoving = true
        }
    },
    ["ok"] = {
        "anim@mp_player_intselfiedock",
        "idle_a",
        "OK",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["dock"] = {
        "anim@mp_player_intincardockstd@rds@",
        "idle_a",
        "Dock",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["outofbreath"] = {
        "re@construction",
        "out_of_breath",
        "Out of Breath",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pickup"] = {
        "random@domestic",
        "pickup_low",
        "Pickup"
    },
    ["push"] = {
        "missfinale_c2ig_11",
        "pushcar_offcliff_f",
        "Push",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["push2"] = {
        "missfinale_c2ig_11",
        "pushcar_offcliff_m",
        "Push 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["point"] = {
        "gestures@f@standing@casual",
        "gesture_point",
        "Point",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pushup"] = {
        "amb@world_human_push_ups@male@idle_a",
        "idle_d",
        "Pushup",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["countdown"] = {
        "random@street_race",
        "grid_girl_race_start",
        "Countdown",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pointright"] = {
        "mp_gun_shop_tut",
        "indicate_right",
        "Point Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["salute"] = {
        "anim@mp_player_intincarsalutestd@ds@",
        "idle_a",
        "Salute",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["salute2"] = {
        "anim@mp_player_intincarsalutestd@ps@",
        "idle_a",
        "Salute 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["salute3"] = {
        "anim@mp_player_intuppersalute",
        "idle_a",
        "Salute 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["scared"] = {
        "random@domestic",
        "f_distressed_loop",
        "Scared",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["scared2"] = {
        "random@homelandsecurity",
        "knees_loop_girl",
        "Scared 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["screwyou"] = {
        "misscommon@response",
        "screw_you",
        "Screw You",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["shakeoff"] = {
        "move_m@_idles@shake_off",
        "shakeoff_1",
        "Shake Off",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3500
        }
    },
    ["shot"] = {
        "random@dealgonewrong",
        "idle_a",
        "Shot",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sleep"] = {
        "timetable@tracy@sleep@",
        "base",
        "Sleep",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["bumsleep"] = {
        "amb@world_human_bum_slumped@male@laying_on_left_side@idle_a",
        "idle_b",
        "Bum Sleep",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["shrug"] = {
        "gestures@f@standing@casual",
        "gesture_shrug_hard",
        "Shrug",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["shrug2"] = {
        "gestures@m@standing@casual",
        "gesture_shrug_hard",
        "Shrug 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["sit"] = {
        "anim@amb@business@bgen@bgen_no_work@",
        "sit_phone_phoneputdown_idle_nowork",
        "Sit",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit2"] = {
        "rcm_barry3",
        "barry_3_sit_loop",
        "Sit 2",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit3"] = {
        "amb@lo_res_idles@",
        "world_human_picnic_male_lo_res_base",
        "Sit 3",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit4"] = {
        "amb@lo_res_idles@",
        "world_human_picnic_female_lo_res_base",
        "Sit 4",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit5"] = {
        "anim@heists@fleeca_bank@ig_7_jetski_owner",
        "owner_idle",
        "Sit 5",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit6"] = {
        "timetable@jimmy@mics3_ig_15@",
        "idle_a_jimmy",
        "Sit 6",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit7"] = {
        "anim@amb@nightclub@lazlow@lo_alone@",
        "lowalone_base_laz",
        "Sit 7",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 900,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit8"] = {
        "timetable@jimmy@mics3_ig_15@",
        "mics3_15_base_jimmy",
        "Sit 8",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sit9"] = {
        "amb@world_human_stupor@male@idle_a",
        "idle_a",
        "Sit 9",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["elbow"] = {
        "anim@veh@lowrider@std@ds@arm@base",
        "sit_low_lowdoor",
        "Window Elbow",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sitlean"] = {
        "timetable@tracy@ig_14@",
        "ig_14_base_tracy",
        "Sit Lean",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sitsad"] = {
        "anim@amb@business@bgen@bgen_no_work@",
        "sit_phone_phoneputdown_sleeping-noworkfemale",
        "Sit Sad",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sitscared"] = {
        "anim@heists@ornate_bank@hostages@hit",
        "hit_loop_ped_b",
        "Sit Scared",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sitscared2"] = {
        "anim@heists@ornate_bank@hostages@ped_c@",
        "flinch_loop",
        "Sit Scared 2",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sitscared3"] = {
        "anim@heists@ornate_bank@hostages@ped_e@",
        "flinch_loop",
        "Sit Scared 3",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sitdrunk"] = {
        "timetable@amanda@drunk@base",
        "base",
        "Sit Drunk",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sitchair2"] = {
        "timetable@ron@ig_5_p3",
        "ig_5_p3_base",
        "Sit Chair 2",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "offchair",
            ExitEmoteType = "Exits"
        }
    },
    ["sitchair3"] = {
        "timetable@reunited@ig_10",
        "base_amanda",
        "Sit Chair 3 (Female)",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "offchair",
            ExitEmoteType = "Exits"
        }
    },
    ["sitchair4"] = {
        "timetable@ron@ig_3_couch",
        "base",
        "Sit Chair 4",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "offchair",
            ExitEmoteType = "Exits"
        }
    },
    ["sitchair5"] = {
        "timetable@jimmy@mics3_ig_15@",
        "mics3_15_base_tracy",
        "Sit Chair Legs Crossed",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "offchair",
            ExitEmoteType = "Exits"
        }
    },
    ["sitchair6"] = {
        "timetable@maid@couch@",
        "base",
        "Sit Chair Lean Back",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "offchair",
            ExitEmoteType = "Exits"
        }
    },
    ["sitchairside"] = {
        "timetable@ron@ron_ig_2_alt1",
        "ig_2_alt1_base",
        "Sit Chair Side",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "offchair",
            ExitEmoteType = "Exits"
        }
    },
    ["situp"] = {
        "amb@world_human_sit_ups@male@idle_a",
        "idle_a",
        "Sit Up",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["clapangry"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "angry_clap_a_player_a",
        "Clap Angry",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["slowclap3"] = {
        "anim@mp_player_intupperslow_clap",
        "idle_a",
        "Slow Clap 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["clap"] = {
        "amb@world_human_cheering@male_a",
        "base",
        "Clap",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["slowclap"] = {
        "anim@mp_player_intcelebrationfemale@slow_clap",
        "slow_clap",
        "Slow Clap",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["slowclap2"] = {
        "anim@mp_player_intcelebrationmale@slow_clap",
        "slow_clap",
        "Slow Clap 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smell"] = {
        "move_p_m_two_idles@generic",
        "fidget_sniff_fingers",
        "Smell",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["stickup"] = {
        "random@countryside_gang_fight",
        "biker_02_stickup_loop",
        "Stick Up",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["stumble"] = {
        "misscarsteal4@actor",
        "stumble",
        "Stumble",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["stunned"] = {
        "stungun@standing",
        "damage",
        "Stunned",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sunbathe"] = {
        "amb@world_human_sunbathe@male@back@base",
        "base",
        "Sunbathe - Hand On Head",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sunbathe2"] = {
        "amb@world_human_sunbathe@female@back@base",
        "base",
        "Sunbathe 2 - Hand Over Face",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["sunbathe3"] = {
        "amb@world_human_sunbathe@female@front@base",
        "base",
        "Sunbathe 3 - Lay On Stomach",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["tpose"] = {
        "missfam5_yoga",
        "a2_pose",
        "T Pose",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tpose2"] = {
        "mp_sleep",
        "bind_pose_180",
        "T Pose 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["think5"] = {
        "mp_cp_welcome_tutthink",
        "b_think",
        "Think 5",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["think"] = {
        "misscarsteal4@aliens",
        "rehearsal_base_idle_director",
        "Think",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["think3"] = {
        "timetable@tracy@ig_8@base",
        "base",
        "Think 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["think2"] = {
        "missheist_jewelleadinout",
        "jh_int_outro_loop_a",
        "Think 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["thumbsup3"] = {
        "anim@mp_player_intincarthumbs_uplow@ds@",
        "enter",
        "Thumbs Up 3",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["thumbsup2"] = {
        "anim@mp_player_intselfiethumbs_up",
        "idle_a",
        "Thumbs Up 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["thumbsup"] = {
        "anim@mp_player_intupperthumbs_up",
        "idle_a",
        "Thumbs Up",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["type"] = {
        "anim@heists@prison_heiststation@cop_reactions",
        "cop_b_idle",
        "Type",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["type2"] = {
        "anim@heists@prison_heistig1_p1_guard_checks_bus",
        "loop",
        "Type 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["type3"] = {
        "mp_prison_break",
        "hack_loop",
        "Type 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["type4"] = {
        "mp_fbi_heist",
        "loop",
        "Type 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["warmth"] = {
        "amb@world_human_stand_fire@male@idle_a",
        "idle_a",
        "Warmth",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave4"] = {
        "random@mugging5",
        "001445_01_gangintimidation_1_female_idle_b",
        "Wave 4",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["wave2"] = {
        "anim@mp_player_intcelebrationfemale@wave",
        "wave",
        "Wave 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave3"] = {
        "friends@fra@ig_1",
        "over_here_idle_a",
        "Wave 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave"] = {
        "friends@frj@ig_1",
        "wave_a",
        "Wave",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave5"] = {
        "friends@frj@ig_1",
        "wave_b",
        "Wave 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave6"] = {
        "friends@frj@ig_1",
        "wave_c",
        "Wave 6",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave7"] = {
        "friends@frj@ig_1",
        "wave_d",
        "Wave 7",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave8"] = {
        "friends@frj@ig_1",
        "wave_e",
        "Wave 8",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wave9"] = {
        "gestures@m@standing@casual",
        "gesture_hello",
        "Wave 9",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["whistle"] = {
        "taxi_hail",
        "hail_taxi",
        "Whistle",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1300
        }
    },
    ["whistle2"] = {
        "rcmnigel1c",
        "hailing_whistle_waive_a",
        "Whistle 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["yeah"] = {
        "anim@mp_player_intupperair_shagging",
        "idle_a",
        "Yeah",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lift"] = {
        "random@hitch_lift",
        "idle_f",
        "Lift",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lol"] = {
        "anim@arena@celeb@flat@paired@no_props@",
        "laugh_a_player_b",
        "LOL",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["lol2"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "giggle_a_player_b",
        "LOL 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["statue2"] = {
        "fra_0_int-1",
        "cs_lamardavis_dual-1",
        "Statue 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["statue3"] = {
        "club_intro2-0",
        "csb_englishdave_dual-0",
        "Statue 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["gangsign"] = {
        "mp_player_int_uppergang_sign_a",
        "mp_player_int_gang_sign_a",
        "Gang Sign",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gangsign2"] = {
        "mp_player_int_uppergang_sign_b",
        "mp_player_int_gang_sign_b",
        "Gang Sign 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gangsign3"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_b@low@ps@base",
        "idle_a",
        "Gang Sign 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gangsign4"] = {
        "amb@code_human_in_car_mp_actions@v_sign@std@rds@base",
        "idle_a",
        "Gang Sign 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["passout"] = {
        "missarmenian2",
        "drunk_loop",
        "Passout",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 900,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["passout2"] = {
        "missarmenian2",
        "corpse_search_exit_ped",
        "Passout 2",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 900,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["passout3"] = {
        "anim@gangops@morgue@table@",
        "body_search",
        "Passout 3",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 900,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["passout4"] = {
        "mini@cpr@char_b@cpr_def",
        "cpr_pumpchest_idle",
        "Passout 4",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 900,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["passout5"] = {
        "random@mugging4",
        "flee_backward_loop_shopkeeper",
        "Passout 5",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 900,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["petting"] = {
        "creatures@rottweiler@tricks@",
        "petting_franklin",
        "Petting",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["crawl"] = {
        "move_injured_ground",
        "front_loop",
        "Crawl",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "meditateup",
            ExitEmoteType = "Exits"
        }
    },
    ["flip2"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "cap_a_player_a",
        "Flip 2"
    },
    ["flip"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "flip_a_player_a",
        "Flip"
    },
    ["slide"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "slide_a_player_a",
        "Slide"
    },
    ["slide2"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "slide_b_player_a",
        "Slide 2"
    },
    ["slide3"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "slide_c_player_a",
        "Slide 3"
    },
    ["slugger"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "slugger_a_player_a",
        "Slugger"
    },
    ["flipoff"] = {
        "anim@arena@celeb@podium@no_prop@",
        "flip_off_a_1st",
        "Flip Off",
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ["flipoff2"] = {
        "anim@arena@celeb@podium@no_prop@",
        "flip_off_c_1st",
        "Flip Off 2",
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ["bow"] = {
        "anim@arena@celeb@podium@no_prop@",
        "regal_c_1st",
        "Bow",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bow2"] = {
        "anim@arena@celeb@podium@no_prop@",
        "regal_a_1st",
        "Bow 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["keyfob"] = {
        "anim@mp_player_intmenu@key_fob@",
        "fob_click",
        "Key Fob",
        AnimationOptions = {
            EmoteLoop = false,
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["slap"] = {
        "melee@unarmed@streamed_variations",
        "plyr_takedown_front_slap",
        "Slap",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["headbutt"] = {
        "melee@unarmed@streamed_variations",
        "plyr_takedown_front_headbutt",
        "Headbutt"
    },
    ["fishdance"] = {
        "anim@mp_player_intupperfind_the_fish",
        "idle_a",
        "Fish Dance",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peace"] = {
        "mp_player_int_upperpeace_sign",
        "mp_player_int_peace_sign",
        "Peace",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peace2"] = {
        "anim@mp_player_intupperpeace",
        "idle_a",
        "Peace 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peace3"] = {
        "anim@mp_player_intupperpeace",
        "idle_a_fp",
        "Peace 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peace4"] = {
        "anim@mp_player_intincarpeacestd@ds@",
        "idle_a",
        "Peace 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peace5"] = {
        "anim@mp_player_intincarpeacestd@ds@",
        "idle_a_fp",
        "Peace 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peace6"] = {
        "anim@mp_player_intincarpeacebodhi@ds@",
        "idle_a",
        "Peace 6",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peace7"] = {
        "anim@mp_player_intincarpeacebodhi@ds@",
        "idle_a_fp",
        "Peace 7",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peacef"] = {
        "anim@mp_player_intcelebrationfemale@peace",
        "peace",
        "Peace Female",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cpr"] = {
        "mini@cpr@char_a@cpr_str",
        "cpr_pumpchest",
        "CPR",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["cpr2"] = {
        "mini@cpr@char_a@cpr_str",
        "cpr_pumpchest",
        "CPR 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ledge"] = {
        "missfbi1",
        "ledge_loop",
        "Ledge",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["airplane"] = {
        "missfbi1",
        "ledge_loop",
        "Air Plane",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["peek"] = {
        "random@paparazzi@peek",
        "left_peek_a",
        "Peek",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["cough"] = {
        "timetable@gardener@smoking_joint",
        "idle_cough",
        "Cough",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["stretch"] = {
        "mini@triathlon",
        "idle_e",
        "Stretch",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["stretch2"] = {
        "mini@triathlon",
        "idle_f",
        "Stretch 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["stretch3"] = {
        "mini@triathlon",
        "idle_d",
        "Stretch 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["stretch4"] = {
        "rcmfanatic1maryann_stretchidle_b",
        "idle_e",
        "Stretch 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["celebrate"] = {
        "rcmfanatic1celebrate",
        "celebrate",
        "Celebrate",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["punching"] = {
        "rcmextreme2",
        "loop_punching",
        "Punching",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["superhero"] = {
        "rcmbarry",
        "base",
        "Superhero",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["superhero2"] = {
        "rcmbarry",
        "base",
        "Superhero 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mindcontrol"] = {
        "rcmbarry",
        "mind_control_b_loop",
        "Mind Control",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["mindcontrol2"] = {
        "rcmbarry",
        "bar_1_attack_idle_aln",
        "Mind Control 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["clown"] = {
        "rcm_barry2",
        "clown_idle_0",
        "Clown",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["clown2"] = {
        "rcm_barry2",
        "clown_idle_1",
        "Clown 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["clown3"] = {
        "rcm_barry2",
        "clown_idle_2",
        "Clown 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["clown4"] = {
        "rcm_barry2",
        "clown_idle_3",
        "Clown 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["clown5"] = {
        "rcm_barry2",
        "clown_idle_6",
        "Clown 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["tryclothes"] = {
        "mp_clothing@female@trousers",
        "try_trousers_neutral_a",
        "Try Clothes",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["tryclothes2"] = {
        "mp_clothing@female@shirt",
        "try_shirt_positive_a",
        "Try Clothes 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["tryclothes3"] = {
        "mp_clothing@female@shoes",
        "try_shoes_positive_a",
        "Try Clothes 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["nervous2"] = {
        "mp_missheist_countrybank@nervous",
        "nervous_idle",
        "Nervous 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["nervous"] = {
        "amb@world_human_bum_standing@twitchy@idle_a",
        "idle_c",
        "Nervous",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["nervous3"] = {
        "rcmme_tracey1",
        "nervous_loop",
        "Nervous 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["uncuff"] = {
        "mp_arresting",
        "a_uncuff",
        "Uncuff",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["namaste"] = {
        "timetable@amanda@ig_4",
        "ig_4_base",
        "Namaste",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["threaten"] = {
        "random@atmrobberygen",
        "b_atm_mugging",
        "Threaten",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["radio"] = {
        "random@arrests",
        "generic_radio_chatter",
        "Radio",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pull"] = {
        "random@mugging4",
        "struggle_loop_b_thief",
        "Pull",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bird"] = {
        "random@peyote@bird",
        "wakeup",
        "Bird"
    },
    ["chicken"] = {
        "random@peyote@chicken",
        "wakeup",
        "Chicken",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["bark"] = {
        "random@peyote@dog",
        "wakeup",
        "Bark"
    },
    ["rabbit"] = {
        "random@peyote@rabbit",
        "wakeup",
        "Rabbit"
    },
    ["spiderman"] = {
        "missexile3",
        "ex03_train_roof_idle",
        "Spider-Man",
        AnimationOptions = {
            EmoteLoop = true,
            NotInVehicle = true
        }
    },
    ["boi"] = {
        "special_ped@jane@monologue_5@monologue_5c",
        "brotheradrianhasshown_2",
        "BOI",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["adjust"] = {
        "missmic4",
        "michael_tux_fidget",
        "Adjust",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["handsup"] = {
        "missminuteman_1ig_2",
        "handsup_base",
        "Hands Up",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["handsup2"] = {
        "anim@mp_player_intuppersurrender",
        "idle_a_fp",
        "Hands Up 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['handsup3'] = {
        'anim@mp_rollarcoaster',
        'hands_up_idle_a_player_one',
        'Hands Up 3',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["valet"] = {
        "anim@amb@casino@valet_scenario@pose_a@",
        "base_a_m_y_vinewood_01",
        "Valet",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["valet2"] = {
        "anim@amb@casino@valet_scenario@pose_b@",
        "base_a_m_y_vinewood_01",
        "Valet 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["valet3"] = {
        "anim@amb@casino@valet_scenario@pose_d@",
        "base_a_m_y_vinewood_01",
        "Valet 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tighten"] = {
        "timetable@denice@ig_1",
        "idle_b",
        "Tigten (Yoga)",
        AnimationOptions = {
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["fspose"] = {
        "missfam5_yoga",
        "c2_pose",
        "F Sex Pose",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["fspose2"] = {
        "missfam5_yoga",
        "c6_pose",
        "F Sex Pose 2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["fspose3"] = {
        "anim@amb@carmeet@checkout_car@",
        "female_c_idle_d",
        "F Sex Pose 3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["showerf"] = {
        "mp_safehouseshower@female@",
        "shower_enter_into_idle",
        "Shower Enter Female",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["showerf2"] = {
        "mp_safehouseshower@female@",
        "shower_idle_a",
        "Shower Female",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["showerf3"] = {
        "mp_safehouseshower@female@",
        "shower_idle_b",
        "Shower Female 2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["showerm"] = {
        "mp_safehouseshower@male@",
        "male_shower_idle_a",
        "Shower Enter Male",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["showerm2"] = {
        "mp_safehouseshower@male@",
        "male_shower_idle_b",
        "Shower Male 2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["showerm3"] = {
        "mp_safehouseshower@male@",
        "male_shower_idle_c",
        "Shower Male 3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["showerm4"] = {
        "mp_safehouseshower@male@",
        "male_shower_idle_d",
        "Shower Male 4",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["picklock"] = {
        "missheistfbisetup1",
        "hassle_intro_loop_f",
        "Picklock",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["cleanhands"] = {
        "missheist_agency3aig_23",
        "urinal_sink_loop",
        "Clean Them Filthy Hands",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["cleanface"] = {
        "switch@michael@wash_face",
        "loop_michael",
        "Clean Your Face",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["buzz"] = {
        "anim@apt_trans@buzzer",
        "buzz_reg",
        "Buzz Door",
        AnimationOptions = {
            EmoteLoop = false,
            EmoteMoving = false
        }
    },
    ["grieve"] = {
        "anim@miss@low@fin@vagos@",
        "idle_ped05",
        "Grieve The Dead",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["respect"] = {
        "anim@mp_player_intcelebrationmale@respect",
        "respect",
        "Respect Male",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = false
        }
    },
    ["respectf"] = {
        "anim@mp_player_intcelebrationfemale@respect",
        "respect",
        "Respect Female",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = false
        }
    },
    ["bang"] = {
        "anim@mp_player_intcelebrationfemale@bang_bang",
        "bang_bang",
        "Bang Bang ",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["checkcar"] = {
        "anim@amb@carmeet@checkout_car@male_a@idles",
        "idle_b",
        "Check Out · Female ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["checkcar2"] = {
        "anim@amb@carmeet@checkout_car@male_c@idles",
        "idle_a",
        "Check Out 2 · Male ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["showboobs"] = {
        "mini@strip_club@backroom@",
        "stripper_b_backroom_idle_b",
        "Show Boobs ",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 6000,
        },
        AdultAnimation = true
    },
    ["showboobs2"] = {
        "mini@strip_club@idles@stripper",
        "stripper_idle_05",
        "Show Boobs 2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 6000,
        },
        AdultAnimation = true
    },
    ["watchstripper"] = {
        "amb@world_human_strip_watch_stand@male_c@idle_a",
        "idle_b",
        "Watch Stripper ",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 6000,
        },
        AdultAnimation = true
    },
    ["hhands"] = {
        "misssnowie@hearthands",
        "base",
        "Heart Hands",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pee"] = {
        "misscarsteal2peeing",
        "peeing_loop",
        "Pee (Male)",
        AnimationOptions = {
            EmoteStuck = true,
            PtfxAsset = "scr_amb_chop",
            PtfxName = "ent_anim_dog_peeing",
            PtfxNoProp = true,
            PtfxPlacement = {
                -0.05,
                0.3,
                0.0,
                0.0,
                90.0,
                90.0,
                1.0
            },
            PtfxInfo = 'pee',
            PtfxWait = 3000,
            PtfxCanHold = true,
        },
        AdultAnimation = true
    },
    ["pee2"] = {
        "missbigscore1switch_trevor_piss",
        "piss_loop",
        "Pee 2 (Male)",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            PtfxAsset = "scr_amb_chop",
            PtfxName = "ent_anim_dog_peeing",
            PtfxNoProp = true,
            PtfxPlacement = {
                0.0130,
                0.1030,
                0.0,
                0.0,
                90.0,
                90.0,
                1.0
            },
            PtfxInfo = 'pee',
            PtfxWait = 3000,
            PtfxCanHold = true,
        },
        AdultAnimation = true
    },
    ["hump"] = {
        "timetable@trevor@skull_loving_bear",
        "skull_loving_bear",
        "Hump",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["wank"] = {
        "anim@mp_player_intselfiewank",
        "idle_a",
        "Wank",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["wank2"] = {
        "anim@mp_player_intupperwank",
        "idle_a",
        "Wank 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["wank3"] = {
        "mp_player_int_upperwank",
        "mp_player_int_wank_02",
        "Wank 3",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["wank4"] = {
        "mp_player_int_upperwank",
        "mp_player_int_wank_02_fp",
        "Wank 4",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["wank5"] = {
        "mp_player_intwank",
        "mp_player_int_wank",
        "Wank 5",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = false
        },
        AdultAnimation = true
    },
    ["calldog"] = {
        "switch@franklin@plays_w_dog",
        "001916_01_fras_v2_9_plays_w_dog_idle",
        "Call Dog",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["calldogr"] = {
        "missfra0_chop_find",
        "call_chop_r",
        "Call Dog - Right",
        AnimationOptions = {
            EmoteLoop = false,
        }
    },
    ["calldogl"] = {
        "missfra0_chop_find",
        "call_chop_l",
        "Call Dog - Left",
        AnimationOptions = {
            EmoteLoop = false,
        }
    },
    ["block"] = {
        "missheist_agency3ashield_face",
        "idle",
        "Block Face",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["policecrowd"] = {
        "amb@code_human_police_crowd_control@idle_a",
        "idle_a",
        "Police Crowd",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["policecrowd2"] = {
        "amb@code_human_police_crowd_control@idle_b",
        "idle_d",
        "Police Crowd 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["snot"] = {
        "move_p_m_two_idles@generic", 
        "fidget_blow_snot", 
        "Blow Snot", 
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4500,
        }
    }, 
    ["scratch"] = {
        "move_p_m_two_idles@generic", 
        "fidget_scratch_balls", 
        "Scratch Balls", 
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 4000,
        },
        AdultAnimation = true
    },
	["cartaunt"] = {
        "missarmenian1driving_taunts@lamar_1",
        "cmonfrank",
        "Car Taunt",
        AnimationOptions = {
			EmoteMoving = false,
            EmoteDuration = 2000,
        }
    },
	["cartauntb"] = {
        "missarmenian1driving_taunts@lamar_1",
        "cmonmynigga",
        "Car Taunt 2",
        AnimationOptions = {
			EmoteMoving = false,
            EmoteDuration = 2000,
        }
    },
	["cartauntc"] = {
        "missarmenian1driving_taunts@lamar_1",
        "hahahakeepup",
        "Car Taunt 3",
        AnimationOptions = {
			EmoteMoving = false,
            EmoteDuration = 2000,
        }
    },
	["cartauntd"] = {
        "missarmenian1driving_taunts@lamar_1",
        "manthisismeanttobe",
        "Car Taunt 4",
        AnimationOptions = {
			EmoteMoving = false,
            EmoteDuration = 2000,
        }
    },
	["cartaunte"] = {
        "missarmenian1driving_taunts@lamar_1",
        "rememberthis",
        "Car Taunt 5",
        AnimationOptions = {
			EmoteMoving = false,
            EmoteDuration = 3000,
        }
    },
	["cartauntf"] = {
        "missarmenian1driving_taunts@lamar_1",
        "skoolinyoass",
        "Car Taunt 6",
        AnimationOptions = {
			EmoteMoving = false,
            EmoteDuration = 3000,
        }
    },
	["cartauntg"] = {
        "missarmenian1driving_taunts@lamar_1",
        "youaintfuckin",
        "Car Taunt 7",
        AnimationOptions = {
			EmoteMoving = false,
            EmoteDuration = 2000,
        }
    },
	["cartaunth"] = {
        "missarmenian1driving_taunts@franklin",
        "heyidontneedanybody",
        "Car Taunt 8",
        AnimationOptions = {
			EmoteMoving = false,
            EmoteDuration = 2000,
        }
    },
	["cartaunti"] = {
        "missarmenian1driving_taunts@franklin",
        "heymotherfuckayoudriveslowasfuck",
        "Car Taunt 9",
        AnimationOptions = {
			EmoteMoving = false,
            EmoteDuration = 3000,
        }
    },
	["cartauntj"] = {
        "missarmenian1driving_taunts@franklin",
        "kids_on_bicycles",
        "Car Taunt 10",
        AnimationOptions = {
			EmoteMoving = false,
            EmoteDuration = 2000,
        }
    },
	["cartauntk"] = {
        "missarmenian1driving_taunts@franklin",
        "learnhowtouseastick",
        "Car Taunt 11",
        AnimationOptions = {
			EmoteMoving = false,
            EmoteDuration = 2000,
        }
    },
	["cartauntl"] = {
        "missarmenian1driving_taunts@franklin",
        "slowassshit",
        "Car Taunt 12",
        AnimationOptions = {
			EmoteMoving = false,
            EmoteDuration = 2000,
        }
    },
	["cartauntm"] = {
        "mp_intro_seq@mcs_7_race_taunt",
        "mcs_7_taunt_female",
        "Car Taunt 13",
        AnimationOptions = {
			EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
	["cartauntn"] = {
        "mp_intro_seq@mcs_7_race_taunt",
        "mcs_7_taunt_male",
        "Car Taunt 14",
        AnimationOptions = {
			EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },


    ------ The male and female 'interaction menu' emotes from GTA Online can be found under the following animation directories:
    ------
    ------ Male: anim@mp_player_intcelebrationmale
    ------
    ------ Female: anim@mp_player_intcelebrationfemale




    ------ These are Scenarios, some of these dont work on women and some other issues, but still good to have.

    ["atm"] = {
        "Scenario",
        "PROP_HUMAN_ATM",
        "ATM"
    },
    ["bbq"] = {
        "MaleScenario",
        "PROP_HUMAN_BBQ",
        "BBQ"
    },
    ["bumbin"] = {
        "Scenario",
        "PROP_HUMAN_BUM_BIN",
        "Bum Bin"
    },
    ["cheer"] = {
        "Scenario",
        "WORLD_HUMAN_CHEERING",
        "Cheer"
    },
    ["chinup"] = {
        "Scenario",
        "PROP_HUMAN_MUSCLE_CHIN_UPS",
        "Chinup"
    },
    ["clipboard2"] = {
        "MaleScenario",
        "WORLD_HUMAN_CLIPBOARD",
        "Clipboard 2"
    },
    ["cop"] = {
        "Scenario",
        "WORLD_HUMAN_COP_IDLES",
        "Cop"
    },
    ["drill"] = {
        "Scenario",
        "WORLD_HUMAN_CONST_DRILL",
        "Construction Drilling"
    },
    ["filmshocking"] = {
        "Scenario",
        "WORLD_HUMAN_MOBILE_FILM_SHOCKING",
        "Film Shocking"
    },
    ["flex"] = {
        "Scenario",
        "WORLD_HUMAN_MUSCLE_FLEX",
        "Flex"
    },
    ["guard"] = {
        "Scenario",
        "WORLD_HUMAN_GUARD_STAND",
        "Guard"
    },
    ["garden"] = {
        "Scenario",
        "WORLD_HUMAN_GARDENER_PLANT",
        "Gardening"
    },
    ["hammer"] = {
        "Scenario",
        "WORLD_HUMAN_HAMMERING",
        "Hammer"
    },
    ["hangout"] = {
        "Scenario",
        "WORLD_HUMAN_HANG_OUT_STREET",
        "Hangout"
    },
    ["impatient"] = {
        "Scenario",
        "WORLD_HUMAN_STAND_IMPATIENT",
        "Impatient"
    },
    ["janitor"] = {
        "Scenario",
        "WORLD_HUMAN_JANITOR",
        "Janitor"
    },
    ["jog"] = {
        "Scenario",
        "WORLD_HUMAN_JOG_STANDING",
        "Jog"
    },
    ["kneel"] = {
        "Scenario",
        "CODE_HUMAN_MEDIC_KNEEL",
        "Kneel"
    },
    ["lean"] = {
        "Scenario",
        "WORLD_HUMAN_LEANING",
        "Lean"
    },
    ["leanbar"] = {
        "Scenario",
        "PROP_HUMAN_BUM_SHOPPING_CART",
        "Lean Bar"
    },
    ["lookout"] = {
        "Scenario",
        "CODE_HUMAN_CROSS_ROAD_WAIT",
        "Lookout"
    },
    ["maid"] = {
        "Scenario",
        "WORLD_HUMAN_MAID_CLEAN",
        "Maid"
    },
    ["medic"] = {
        "Scenario",
        "CODE_HUMAN_MEDIC_TEND_TO_DEAD",
        "Medic"
    },
    ["musician"] = {
        "MaleScenario",
        "WORLD_HUMAN_MUSICIAN",
        "Musician"
    },
    -- Ambient Music Doesn't Seem To Work For Female, Hence It's Male Only
    ["notepad2"] = {
        "Scenario",
        "CODE_HUMAN_MEDIC_TIME_OF_DEATH",
        "Notepad 2"
    },
    ["parkingmeter"] = {
        "Scenario",
        "PROP_HUMAN_PARKING_METER",
        "Parking Meter"
    },
    ["party"] = {
        "Scenario",
        "WORLD_HUMAN_PARTYING",
        "Party"
    },
    ["texting"] = {
        "Scenario",
        "WORLD_HUMAN_STAND_MOBILE",
        "Texting"
    },
    ["prosthigh"] = {
        "Scenario",
        "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS",
        "Prostitue High"
    },
    ["prostlow"] = {
        "Scenario",
        "WORLD_HUMAN_PROSTITUTE_LOW_CLASS",
        "Prostitue Low"
    },
    ["record"] = {
        "Scenario",
        "WORLD_HUMAN_MOBILE_FILM_SHOCKING",
        "Record"
    },

    -- Sitchair is a litte special, since you want the player to be seated correctly.
    -- So we set it as "ScenarioObject" and do TaskStartScenarioAtPosition() instead of "AtPlace"
    ["sitchair"] = {
        "ScenarioObject",
        "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER",
        "Sit Chair"
    },
    ["smoke"] = {
        "Scenario",
        "WORLD_HUMAN_SMOKING",
        "Smoke"
    },
    ["smokeweed"] = {
        "MaleScenario",
        "WORLD_HUMAN_DRUG_DEALER",
        "Smoke Weed (Male)"
    },
    --Female
    ["smokeweed2"] = {
        "Scenario",
        "WORLD_HUMAN_SMOKING_POT",
        "Smoke Weed (Female)"
    },
    -- Female
    ["statue"] = {
        "Scenario",
        "WORLD_HUMAN_HUMAN_STATUE",
        "Statue"
    },
    ["weld"] = {
        "Scenario",
        "WORLD_HUMAN_WELDING",
        "Weld"
    },
    ["windowshop"] = {
        "Scenario",
        "WORLD_HUMAN_WINDOW_SHOP_BROWSE",
        "Window Shop"
    },
    ["yoga"] = {
        "Scenario",
        "WORLD_HUMAN_YOGA",
        "Yoga"
    },

    -- CASINO DLC EMOTES (Requires gamebuild 2060 or higher)
    ["karate"] = {
        "anim@mp_player_intcelebrationfemale@karate_chops",
        "karate_chops",
        "Karate"
    },
    ["karate2"] = {
        "anim@mp_player_intcelebrationmale@karate_chops",
        "karate_chops",
        "Karate 2"
    },
    ["cutthroat"] = {
        "anim@mp_player_intcelebrationmale@cut_throat",
        "cut_throat",
        "Cut Throat"
    },
    ["cutthroat2"] = {
        "anim@mp_player_intcelebrationfemale@cut_throat",
        "cut_throat",
        "Cut Throat 2"
    },
    ["mindblown"] = {
        "anim@mp_player_intcelebrationmale@mind_blown",
        "mind_blown",
        "Mind Blown",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["mindblown2"] = {
        "anim@mp_player_intcelebrationfemale@mind_blown",
        "mind_blown",
        "Mind Blown 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["boxing"] = {
        "anim@mp_player_intcelebrationmale@shadow_boxing",
        "shadow_boxing",
        "Boxing",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["boxing2"] = {
        "anim@mp_player_intcelebrationfemale@shadow_boxing",
        "shadow_boxing",
        "Boxing 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["stink"] = {
        "anim@mp_player_intcelebrationfemale@stinker",
        "stinker",
        "Stink",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["think4"] = {
        "anim@amb@casino@hangout@ped_male@stand@02b@idles",
        "idle_a",
        "Think 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["adjusttie"] = {
        "clothingtie",
        "try_tie_positive_a",
        "Adjust Tie",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 5000
        }
    },
    ["relax"] = {
        "lying@on_grass",
        "base",
        "Relax ",
        AnimationOptions = {
            EmoteLoop = true,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["relax2"] = {
        "lying@on_couch_legs_crossed",
        "base",
        "Relax 2",
        AnimationOptions = {
            EmoteLoop = true,
            NotInVehicle = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["layncry"] = {
        "anim@amb@nightclub@lazlow@lo_sofa@",
        "lowsofa_dlg_fuckedup_laz",
        "Lay & Cry",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["layncry2"] = {
        "anim@amb@nightclub@lazlow@lo_sofa@",
        "lowsofa_base_laz",
        "Lay & Cry 2",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["layncry3"] = {
        "anim@amb@nightclub@lazlow@lo_sofa@",
        "lowsofa_dlg_notagain_laz",
        "Lay & Cry 3",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["layncry4"] = {
        "anim@amb@nightclub@lazlow@lo_sofa@",
        "lowsofa_dlg_notagain_laz",
        "Lay & Cry 4",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["layncry5"] = {
        "anim@amb@nightclub@lazlow@lo_sofa@",
        "lowsofa_dlg_shit2strong_laz",
        "Lay & Cry 5",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["layncry6"] = {
        "misschinese2_crystalmaze",
        "2int_loop_a_taocheng",
        "Lay & Cry 6",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 700,
            ExitEmote = "getup",
            ExitEmoteType = "Exits"
        }
    },
    ["kick"] = {
        "missheistdockssetup1ig_13@kick_idle",
        "guard_beatup_kickidle_guard1",
        "Kick",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["kick2"] = {
        "missheistdockssetup1ig_13@kick_idle",
        "guard_beatup_kickidle_guard2",
        "Kick 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["kick3"] = {
        "melee@unarmed@streamed_core",
        "kick_close_a",
        "Kick 3",
        AnimationOptions = {
            EmoteDuration = 1750
        }
    },
    ["crosshands"] = {
        "anim@amb@carmeet@checkout_car@",
        "male_e_base",
        "Cross hands",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
}

Animation.PropEmotes = {
    ["umbrella"] = {
        'rcmnigel1d',
        'base_club_shoulder',
        "Umbrella",
        AnimationOptions = {
            Prop = "p_amb_brolly_01_s",
            PropBone = 28422,
            PropPlacement = {
                0.0700,
                0.0100,
                0.1100,
                2.3402393,
                -150.9605721,
                57.3374916
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['umbrella2'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Umbrella 2',
        AnimationOptions = {
            Prop = 'p_amb_brolly_01',
            PropBone = 28422,
            PropPlacement = {
                0.0700,
                0.0100,
                0.1100,
                2.3402393,
                -150.9605721,
                57.3374916
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    -----------------------------------------------------------------------------------------------------
    ------ This is an example of an emote with 2 props, pretty simple! ----------------------------------
    -----------------------------------------------------------------------------------------------------
    ["notepad"] = {
        "missheistdockssetup1clipboard@base",
        "base",
        "Notepad",
        AnimationOptions = {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {
                0.1,
                0.02,
                0.05,
                10.0,
                0.0,
                0.0
            },
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 58866,
            SecondPropPlacement = {
                0.11,
                -0.02,
                0.001,
                -120.0,
                0.0,
                0.0
            },
            -- EmoteLoop is used for emotes that should loop, its as simple as that.
            -- Then EmoteMoving is used for emotes that should only play on the upperbody.
            -- The code then checks both values and sets the MovementType to the correct one
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["rose"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Rose",
        AnimationOptions = {
            Prop = "prop_single_rose",
            PropBone = 18905,
            PropPlacement = {
                0.13,
                0.15,
                0.0,
                -100.0,
                0.0,
                -20.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smoke2"] = {
        "amb@world_human_aa_smoke@male@idle_a",
        "idle_c",
        "Smoke 2",
        AnimationOptions = {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smoke3"] = {
        "amb@world_human_aa_smoke@male@idle_a",
        "idle_b",
        "Smoke 3",
        AnimationOptions = {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["smoke4"] = {
        "amb@world_human_smoking@female@idle_a",
        "idle_b",
        "Smoke 4",
        AnimationOptions = {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["vape"] = {
        "amb@world_human_smoking@male@male_b@base",
        "base",
        "Vape",
        AnimationOptions = {
            Prop = 'ba_prop_battle_vape_01',
            PropBone = 28422,
            PropPlacement = {
                -0.0290,
                0.0070,
                -0.0050,
                91.0,
                270.0,
                -360.0
            },
            EmoteMoving = true,
            EmoteLoop = true,
            PtfxAsset = "scr_agencyheistb",
            PtfxName = "scr_agency3b_elec_box",
            PtfxNoProp = true,
            PtfxBone = 31086,
            PtfxPlacement = {
                0.0,
                0.170,
                0.0,
                0.0,
                0.0,
                0.0,
                1.4
            },
            PtfxInfo = 'vape',
            PtfxWait = 0.8,
            PtfxCanHold = true
        }
    },
    ["vape2"] = {
        "amb@world_human_smoking@male@male_b@base",
        "base",
        "Vape 2",
        AnimationOptions = {
            Prop = 'xm3_prop_xm3_vape_01a',
            PropBone = 28422,
            PropPlacement = {
                -0.02,
                -0.02,
                0.02,
                58.0,
                110.0,
                10.0
            },
            EmoteMoving = true,
            EmoteLoop = true,
            PtfxAsset = "scr_agencyheistb",
            PtfxName = "scr_agency3b_elec_box",
            PtfxNoProp = true,
            PtfxBone = 31086,
            PtfxPlacement = {
                0.0,
                0.170,
                0.0,
                0.0,
                0.0,
                0.0,
                1.4
            },
            PtfxInfo = 'vape',
            PtfxWait = 1.8,
            PtfxCanHold = true
        }
    },
    ["bong"] = {
        "anim@safehouse@bong",
        "bong_stage3",
        "Bong",
        AnimationOptions = {
            Prop = 'hei_heist_sh_bong_01',
            PropBone = 18905,
            PropPlacement = {
                0.10,
                -0.25,
                0.0,
                95.0,
                190.0,
                180.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
            PtfxAsset = "scr_agencyheistb",
            PtfxName = "scr_agency3b_elec_box",
            PtfxNoProp = true,
            PtfxBone = 31086,
            PtfxPlacement = {
                0.0,
                0.170,
                0.0,
                0.0,
                0.0,
                0.0,
                1.4
            },
            PtfxInfo = 'vape',
            PtfxWait = 0.8,
            PtfxCanHold = true
        }
    },
    ["bong2"] = {
        "anim@safehouse@bong",
        "bong_stage3",
        "Bong 2",
        AnimationOptions = {
            Prop = 'xm3_prop_xm3_bong_01a',
            PropBone = 18905,
            PropPlacement = {
                0.10,
                -0.25,
                0.0,
                95.0,
                190.0,
                180.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
            PtfxAsset = "scr_agencyheistb",
            PtfxName = "scr_agency3b_elec_box",
            PtfxNoProp = true,
            PtfxBone = 31086,
            PtfxPlacement = {
                0.0,
                0.170,
                0.0,
                0.0,
                0.0,
                0.0,
                1.4
            },
            PtfxInfo = 'vape',
            PtfxWait = 0.8,
            PtfxCanHold = true
        }
    },
    ["bong3"] = {
        "sit_bong@dark",
        "sit_bong_clip",
        "Bong 3 - Sit & Rip",
        AnimationOptions = {
            Prop = 'hei_heist_sh_bong_01',
            PropBone = 60309,
            PropPlacement = {
                0.0490,
               -0.2000,
                0.0800,
              -85.0199,
              102.3320,
              -15.0085
            },
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits",
            PtfxAsset = "scr_agencyheistb",
            PtfxName = "scr_agency3b_elec_box",
            PtfxNoProp = true,
            PtfxBone = 31086,
            PtfxPlacement = {
                0.0,
                0.170,
                0.0,
                0.0,
                0.0,
                0.0,
                1.4
            },
            PtfxInfo = 'vape',
            PtfxWait = 0.8,
            PtfxCanHold = true
        }
    },
    ["bong4"] = {
        "sit_bong@dark",
        "sit_bong_clip",
        "Bong 4 - Sit & Rip Purple",
        AnimationOptions = {
            Prop = 'xm3_prop_xm3_bong_01a',
            PropBone = 60309,
            PropPlacement = {
                0.0490,
               -0.2000,
                0.0800,
              -85.0199,
              102.3320,
              -15.0085
            },
            EmoteLoop = true,
            ExitEmote = "getup",
            ExitEmoteType = "Exits",
            PtfxAsset = "scr_agencyheistb",
            PtfxName = "scr_agency3b_elec_box",
            PtfxNoProp = true,
            PtfxBone = 31086,
            PtfxPlacement = {
                0.0,
                0.170,
                0.0,
                0.0,
                0.0,
                0.0,
                1.4
            },
            PtfxInfo = 'vape',
            PtfxWait = 0.8,
            PtfxCanHold = true
        }
    },
    ["fishing1"] = {
        "amb@world_human_stand_fishing@idle_a",
        "idle_a",
        "Fishing 1",
        AnimationOptions = {
            Prop = 'prop_fishing_rod_01',
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["fishing2"] = {
        "amb@world_human_stand_fishing@idle_a",
        "idle_b",
        "Fishing 2",
        AnimationOptions = {
            Prop = 'prop_fishing_rod_01',
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["fishing3"] = {
        "amb@world_human_stand_fishing@idle_a",
        "idle_c",
        "Fishing 3",
        AnimationOptions = {
            Prop = 'prop_fishing_rod_01',
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["suitcase"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Suitcase",
        AnimationOptions = {
            Prop = "prop_ld_suitcase_01",
            PropBone = 57005,
            PropPlacement = {
                0.35,
                0.0,
                0.0,
                0.0,
                266.0,
                90.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["suitcase2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Suitcase 2",
        AnimationOptions = {
            Prop = "prop_security_case_01",
            PropBone = 57005,
            PropPlacement = {
                0.13,
                0.0,
                -0.01,
                0.0,
                280.0,
                90.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["boombox"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Boombox",
        AnimationOptions = {
            Prop = "prop_boombox_01",
            PropBone = 57005,
            PropPlacement = {
                0.27,
                0.0,
                0.0,
                0.0,
                263.0,
                58.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["toolbox"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Toolbox",
        AnimationOptions = {
            Prop = "prop_tool_box_04",
            PropBone = 28422,
            PropPlacement = {
                0.3960,
                0.0410,
                -0.0030,
                -90.00,
                0.0,
                90.00
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["toolbox2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Toolbox 2",
        AnimationOptions = {
            Prop = "imp_prop_tool_box_01a",
            PropBone = 28422,
            PropPlacement = {
                0.3700,
                0.0200,
                0.0,
                90.00,
                0.0,
                -90.00
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["toolbox3"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Toolbox 3",
        AnimationOptions = {
            Prop = "xm3_prop_xm3_tool_box_01a",
            PropBone = 28422,
            PropPlacement = {
                0.3700,
                0.0200,
                0.0,
                90.00,
                0.0,
                -90.00
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["toolbox4"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Toolbox 4",
        AnimationOptions = {
            Prop = "xm3_prop_xm3_tool_box_02a",
            PropBone = 28422,
            PropPlacement = {
                0.3700,
                0.0200,
                0.0,
                90.00,
                0.0,
                -90.00
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gbag"] = {
        "missfbi4prepp1",
        "_idle_garbage_man",
        "Garbage Bag",
        AnimationOptions = {
            Prop = "prop_cs_street_binbag_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0400,
                -0.0200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beerbox"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Beer Box 1",
        AnimationOptions = {
            Prop = "v_ret_ml_beerdus",
            PropBone = 57005,
            PropPlacement = {
                0.22,
                0.0,
                0.0,
                0.0,
                266.0,
                48.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beerbox2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Beer Box 2",
        AnimationOptions = {
            Prop = "v_ret_ml_beeram",
            PropBone = 57005,
            PropPlacement = {
                0.22,
                0.0,
                0.0,
                0.0,
                266.0,
                48.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beerbox3"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Beer Box 3",
        AnimationOptions = {
            Prop = "v_ret_ml_beerpride",
            PropBone = 57005,
            PropPlacement = {
                0.22,
                0.0,
                0.0,
                0.0,
                266.0,
                48.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beerbox4"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Beer Box 4",
        AnimationOptions = {
            Prop = "v_ret_ml_beerbar",
            PropBone = 57005,
            PropPlacement = {
                0.22,
                0.0,
                0.0,
                0.0,
                266.0,
                60.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mugshot"] = {
        "mp_character_creation@customise@male_a",
        "loop",
        "Mugshot",
        AnimationOptions = {
            Prop = 'prop_police_id_board',
            PropBone = 58868,
            PropPlacement = {
                0.12,
                0.24,
                0.0,
                5.0,
                0.0,
                70.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["coffee"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Coffee",
        AnimationOptions = {
            Prop = 'p_amb_coffeecup_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["whiskey"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Whiskey",
        AnimationOptions = {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {
                0.01,
                -0.01,
                -0.06,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["whiskeyb"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_a",
        "Whiskey Bottle",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_bottle_2_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.05,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beer"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_c",
        "Beer",
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.06,
                0.0,
                15.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beer2"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_c",
        "Beer 2",
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.06,
                0.0,
                15.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beer3"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_a",
        "Beer 3",
        AnimationOptions = {
            Prop = 'p_cs_bottle_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beer4"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_b",
        "Beer 4 - Pour One Out For The Homies",
        AnimationOptions = {
            Prop = 'p_cs_bottle_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["beer5"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_c",
        "Beer 5",
        AnimationOptions = {
            Prop = 'p_cs_bottle_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["whiskeyb2"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_a",
        "Whiskey Bottle 2",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_bottle_2_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.05,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["whiskeyb3"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_a",
        "Whiskey Bottle 3",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_bottle_2_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.05,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["beerf"] = {
        "amb@world_human_drinking@beer@female@idle_a",
        "idle_a",
        "Beer Female",
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                -0.0,
                0.05,
                15.0,
                15.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beercan"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Beer Can",
        AnimationOptions = {
            Prop = 'v_res_tt_can01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                80.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beercan2"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Beer Can 2",
        AnimationOptions = {
            Prop = 'v_res_tt_can02',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
             -150.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beercan3"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Beer Can 3",
        AnimationOptions = {
            Prop = 'h4_prop_h4_can_beer_01a',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
               -0.0700,
                0.0,
                0.0,
                90.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wine2"] = {
        "amb@world_human_drinking@beer@female@idle_a",
        "idle_e",
        "Wine 2 - Bottle",
        AnimationOptions = {
            Prop = 'prop_wine_rose',
            PropBone = 28422,
            PropPlacement = {
                -0.0,
                0.04,
                -0.19,
                10.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
            ---       PropPlacement = {-0.0, 0.03, -0.20, 5.0, 0.0, 0.0},
            ---     F&B   L&R   U&D  R.F&B
        }
    },
    ["beerf3"] = {
        "amb@world_human_drinking@beer@female@idle_a",
        "idle_a",
        "Beer Female 3",
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                -0.0,
                0.05,
                15.0,
                15.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["wine3"] = {
        "amb@world_human_drinking@beer@female@idle_a",
        "idle_e",
        "Wine 3 - Bottle",
        AnimationOptions = {
            Prop = 'prop_wine_rose',
            PropBone = 28422,
            PropPlacement = {
                -0.0,
                0.04,
                -0.19,
                10.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["cup"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Cup",
        AnimationOptions = {
            Prop = 'prop_plastic_cup_02',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["apple"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Apple",
        AnimationOptions = {
            Prop = 'sf_prop_sf_apple_01b',
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0150,
                -0.0200,
                -124.6964,
                -166.5760,
                8.4572
            },
            EmoteMoving = true
        }
    },
    ["taco"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Taco",
        AnimationOptions = {
            Prop = 'prop_taco_01',
            PropBone = 60309,
            PropPlacement = {
                -0.0170,
                0.0070,
                -0.0210,
                107.9846,
                -105.0251,
                55.7779
            },
            EmoteMoving = true
        }
    },
    ["hotdog"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Hotdog",
        AnimationOptions = {
            Prop = 'prop_cs_hotdog_02',
            PropBone = 60309,
            PropPlacement = {
                -0.0300,
                0.0100,
                -0.0100,
                95.1071,
                94.7001,
                -66.9179
            },
            EmoteMoving = true
        }
    },
    ["donut"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Donut",
        AnimationOptions = {
            Prop = 'prop_amb_donut',
            PropBone = 18905,
            PropPlacement = {
                0.13,
                0.05,
                0.02,
                -50.0,
                16.0,
                60.0
            },
            EmoteMoving = true
        }
    },
    ["burger"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Burger",
        AnimationOptions = {
            Prop = 'prop_cs_burger_01',
            PropBone = 18905,
            PropPlacement = {
                0.13,
                0.05,
                0.02,
                -50.0,
                16.0,
                60.0
            },
            EmoteMoving = true
        }
    },
    ["sandwich"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Sandwich",
        AnimationOptions = {
            Prop = 'prop_sandwich_01',
            PropBone = 18905,
            PropPlacement = {
                0.13,
                0.05,
                0.02,
                -50.0,
                16.0,
                60.0
            },
            EmoteMoving = true
        }
    },
    ["soda"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Soda - eCola Can",
        AnimationOptions = {
            Prop = 'prop_ecola_can',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                130.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["soda2"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Soda 2 - Sprunk Can",
        AnimationOptions = {
            Prop = 'ng_proc_sodacan_01b',
            PropBone = 28422,
            PropPlacement = {
                0.0050,
               -0.0010,
               -0.0800,
                0.0,
                0.0,
                160.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
   },
    ["soda3"] = {
        "amb@code_human_wander_drinking@male@base",
        "static",
        "Soda 3 - P's & Q's Cup",
        AnimationOptions = {
            Prop = 'v_ret_fh_bscup',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0400,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["soda4"] = {
        "amb@code_human_wander_drinking@male@base",
        "static",
        "Soda 4 - Burger Shot Cup",
        AnimationOptions = {
            Prop = 'prop_cs_bs_cup',
            PropBone = 28422,
            PropPlacement = {
                0.0060,
                0.0010,
                0.0,
                0.0,
                0.0,
             -150.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["soda9"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Soda 9 - Orange Flavoured Can",
        AnimationOptions = {
            Prop = 'prop_orang_can_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                130.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["edrink"] = {
        "mp_player_intdrink",
        "loop_bottle",
        "Energy Drink - Bottle",
        AnimationOptions =
        {
            Prop = "prop_energy_drink",
            PropBone = 60309,
            PropPlacement = {
                0.0080,
                0.0010,
                0.0160,
                3.5690,
                4.6611,
              -49.9065
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["edrink2"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Energy Drink - Can",
        AnimationOptions =
        {
            Prop = "sf_prop_sf_can_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
             -110.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["edrink3"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Energy Drink - XXL Can",
        AnimationOptions =
        {
            Prop = "sf_p_sf_grass_gls_s_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0000,
                0.0000,
               -0.1400,
                0.0000,
                0.0000,
                9.0000
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["water"] = {
        "mp_player_intdrink",
        "loop_bottle",
        "Water Bottle",
        AnimationOptions =
        {
            Prop = "vw_prop_casino_water_bottle_01a",
            PropBone = 60309,
            PropPlacement = {
                0.0080,
                0.0,
               -0.0500,
                0.0,
                0.0,
              -40.0000
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["egobar"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Ego Bar",
        AnimationOptions = {
            Prop = 'prop_choc_ego',
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteMoving = true
        }
    },
    ["candy"] = {
        "mp_player_inteat@pnq",
        "loop",
        "Candy",
        AnimationOptions = {
            Prop = 'prop_candy_pqs',
            PropBone = 60309,
            PropPlacement = {
                -0.0300,
                0.0180,
                0.0,
                180.0,
                180.0,
                -88.099
            },
            EmoteMoving = true
        }
    },
    ["wine"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Wine",
        AnimationOptions = {
            Prop = 'prop_drink_redwine',
            PropBone = 18905,
            PropPlacement = {
                0.10,
                -0.03,
                0.03,
                -100.0,
                0.0,
                -10.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["flute"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Flute",
        AnimationOptions = {
            Prop = 'prop_champ_flute',
            PropBone = 18905,
            PropPlacement = {
                0.10,
                -0.03,
                0.03,
                -100.0,
                0.0,
                -10.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["champagne"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Champagne",
        AnimationOptions = {
            Prop = 'prop_drink_champ',
            PropBone = 18905,
            PropPlacement = {
                0.10,
                -0.03,
                0.03,
                -100.0,
                0.0,
                -10.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["cigar"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Cigar",
        AnimationOptions = {
            Prop = 'prop_cigar_02',
            PropBone = 47419,
            PropPlacement = {
                0.010,
                0.0,
                0.0,
                50.0,
                0.0,
                -80.0
            },
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["cigar2"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Cigar 2",
        AnimationOptions = {
            Prop = 'prop_cigar_01',
            PropBone = 47419,
            PropPlacement = {
                0.010,
                0.0,
                0.0,
                50.0,
                0.0,
                -80.0
            },
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["guitar"] = {
        "amb@world_human_musician@guitar@male@idle_a",
        "idle_b",
        "Guitar",
        AnimationOptions = {
            Prop = 'prop_acc_guitar_01',
            PropBone = 24818,
            PropPlacement = {
                -0.1,
                0.31,
                0.1,
                0.0,
                20.0,
                150.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitar2"] = {
        "switch@trevor@guitar_beatdown",
        "001370_02_trvs_8_guitar_beatdown_idle_busker",
        "Guitar 2",
        AnimationOptions = {
            Prop = 'prop_acc_guitar_01',
            PropBone = 24818,
            PropPlacement = {
                -0.05,
                0.31,
                0.1,
                0.0,
                20.0,
                150.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitarelectric"] = {
        "amb@world_human_musician@guitar@male@idle_a",
        "idle_b",
        "Guitar Electric",
        AnimationOptions = {
            Prop = 'prop_el_guitar_01',
            PropBone = 24818,
            PropPlacement = {
                -0.1,
                0.31,
                0.1,
                0.0,
                20.0,
                150.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitarelectric2"] = {
        "amb@world_human_musician@guitar@male@idle_a",
        "idle_b",
        "Guitar Electric 2",
        AnimationOptions = {
            Prop = 'prop_el_guitar_03',
            PropBone = 24818,
            PropPlacement = {
                -0.1,
                0.31,
                0.1,
                0.0,
                20.0,
                150.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitarcarry"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guitar Case Carry",
        AnimationOptions = {
            Prop = "sf_prop_sf_guitar_case_01a",
            PropBone = 28422,
            PropPlacement = {
                0.2800,
                -0.2000,
                -0.0600,
                0.0,
                0.0,
                15.0000
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarcarry2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guitar Carry Accoustic",
        AnimationOptions = {
            Prop = "prop_acc_guitar_01",
            PropBone = 28422,
            PropPlacement = {
                0.1500,
                -0.1400,
                -0.0200,
                -101.5083,
                5.7251,
                29.4987
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarcarry3"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guitar Carry Electric ",
        AnimationOptions = {
            Prop = "prop_el_guitar_01",
            PropBone = 28422,
            PropPlacement = {
                0.1100,
                -0.1200,
                -0.0500,
                -80.0000,
                0.0,
                21.9999
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarcarry4"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guitar Carry Electric 2 ",
        AnimationOptions = {
            Prop = "prop_el_guitar_02",
            PropBone = 28422,
            PropPlacement = {
                0.1100,
                -0.1200,
                -0.0500,
                -80.0000,
                0.0,
                21.9999
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarcarry5"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guitar Carry Electric 3 ",
        AnimationOptions = {
            Prop = "prop_el_guitar_03",
            PropBone = 28422,
            PropPlacement = {
                0.1100,
                -0.1200,
                -0.0500,
                -80.0000,
                0.0,
                21.9999
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarcarry6"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guitar Carry Electric 4 ",
        AnimationOptions = {
            Prop = "vw_prop_casino_art_guitar_01a",
            PropBone = 28422,
            PropPlacement = {
                0.1100,
                -0.1200,
                -0.0500,
                -80.0000,
                0.0,
                21.9999
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guitarcarry7"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guitar Carry Electric 5 ",
        AnimationOptions = {
            Prop = "sf_prop_sf_el_guitar_02a",
            PropBone = 28422,
            PropPlacement = {
                0.1100,
                -0.1200,
                -0.0500,
                -80.0000,
                0.0,
                21.9999
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["book"] = {
        "cellphone@",
        "cellphone_text_read_base",
        "Book",
        AnimationOptions = {
            Prop = 'prop_novel_01',
            PropBone = 6286,
            PropPlacement = {
                0.15,
                0.03,
                -0.065,
                0.0,
                180.0,
                90.0
            },
            -- This positioning isnt too great, was to much of a hassle
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["bouquet"] = {
        "impexp_int-0",
        "mp_m_waremech_01_dual-0",
        "Bouquet",
        AnimationOptions = {
            Prop = 'prop_snow_flower_02',
            PropBone = 24817,
            PropPlacement = {
                -0.29,
                0.40,
                -0.02,
                -90.0,
                -90.0,
                0.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["teddy"] = {
        "impexp_int-0",
        "mp_m_waremech_01_dual-0",
        "Teddy",
        AnimationOptions = {
            Prop = 'v_ilev_mr_rasberryclean',
            PropBone = 24817,
            PropPlacement = {
                -0.20,
                0.46,
                -0.016,
                -180.0,
                -90.0,
                0.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["backpack"] = {
        "move_p_m_zero_rucksack",
        "nill",
        "Backpack",
        AnimationOptions = {
            Prop = 'p_michael_backpack_s',
            PropBone = 24818,
            PropPlacement = {
                0.07,
                -0.11,
                -0.05,
                0.0,
                90.0,
                175.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["clipboard"] = {
        "missfam4",
        "base",
        "Clipboard",
        AnimationOptions = {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {
                0.16,
                0.08,
                0.1,
                -130.0,
                -50.0,
                0.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["map"] = {
        "amb@world_human_tourist_map@male@base",
        "base",
        "Map",
        AnimationOptions = {
            Prop = 'prop_tourist_map_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["map2"] = {
        "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a",
        "idle_a",
        "Map 2",
        AnimationOptions = {
            Prop = "prop_tourist_map_01",
            PropBone = 28422,
            PropPlacement = {
                -0.05,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beg"] = {
        "amb@world_human_bum_freeway@male@base",
        "base",
        "Beg",
        AnimationOptions = {
            Prop = 'prop_beggers_sign_03',
            PropBone = 58868,
            PropPlacement = {
                0.19,
                0.18,
                0.0,
                5.0,
                0.0,
                40.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["newspaper"] = {
        "amb@world_human_clipboard@male@idle_a",
        "idle_a",
        "Newspaper",
        AnimationOptions = {
            Prop = 'prop_cliff_paper',
            PropBone = 60309,
            PropPlacement = {
                0.0970,
                -0.0280,
                -0.0170,
                107.4008,
                3.2712,
                -10.5080
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["newspaper2"] = {
        "amb@world_human_clipboard@male@idle_a",
        "idle_a",
        "Newspaper 2",
        AnimationOptions = {
            Prop = 'ng_proc_paper_news_quik',
            PropBone = 60309,
            PropPlacement = {
                0.1590,
                0.0290,
                -0.0100,
                90.9998,
                0.0087,
                0.5000
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["newspaper3"] = {
        "amb@world_human_clipboard@male@idle_a",
        "idle_a",
        "Newspaper 3",
        AnimationOptions = {
            Prop = 'ng_proc_paper_news_rag',
            PropBone = 60309,
            PropPlacement = {
                0.1760,
                -0.00070,
                0.0200,
                99.8306,
                3.2841,
                -4.7185
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["pornmag"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine",
        AnimationOptions = {
            Prop = 'prop_porn_mag_02',
            PropBone = 60309,
            PropPlacement = {
                0.1000,
                -0.0360,
                -0.0300,
                -86.9096,
                179.2527,
                13.8804
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag2"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 2",
        AnimationOptions = {
            Prop = 'prop_cs_magazine',
            PropBone = 60309,
            PropPlacement = {
                0.0800,
                -0.0490,
                -0.0500,
                87.9369,
                -0.4292,
                -14.3925
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag3"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 3",
        AnimationOptions = {
            Prop = 'prop_porn_mag_03',
            PropBone = 60309,
            PropPlacement = {
                0.1000,
                -0.0700,
                -0.0200,
                -90.0000,
                -180.0000,
                22.7007
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag4"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 4",
        AnimationOptions = {
            Prop = 'v_res_tt_pornmag01',
            PropBone = 60309,
            PropPlacement = {
                -0.0200,
                -0.0300,
                0.0000,
                88.9862,
                0.2032,
                -20.0016
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag5"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 5",
        AnimationOptions = {
            Prop = 'v_res_tt_pornmag02',
            PropBone = 60309,
            PropPlacement = {
                -0.0200,
                -0.0300,
                0.0000,
                88.9862,
                0.2032,
                -20.0016
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag6"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 6",
        AnimationOptions = {
            Prop = 'v_res_tt_pornmag03',
            PropBone = 60309,
            PropPlacement = {
                -0.0200,
                -0.0300,
                0.0000,
                88.9862,
                0.2032,
                -20.0016
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag7"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 7",
        AnimationOptions = {
            Prop = 'v_res_tt_pornmag04',
            PropBone = 60309,
            PropPlacement = {
                -0.0200,
                -0.0300,
                0.0000,
                88.9862,
                0.2032,
                -20.0016
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["makeitrain"] = {
        "anim@mp_player_intupperraining_cash",
        "idle_a",
        "Make It Rain",
        AnimationOptions = {
            Prop = 'prop_anim_cash_pile_01',
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                180.0,
                0.0,
                70.0
            },
            EmoteMoving = true,
            EmoteLoop = true,
            PtfxAsset = "scr_xs_celebration",
            PtfxName = "scr_xs_money_rain",
            PtfxPlacement = {
                0.0,
                0.0,
                -0.09,
                -80.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = 'makeitrain',
            PtfxWait = 500,
            PtfxCanHold = true
        }
    },
    ["camera"] = {
        "amb@world_human_paparazzi@male@base",
        "base",
        "Camera",
        AnimationOptions = {
            Prop = 'prop_pap_camera_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
            PtfxAsset = "scr_bike_business",
            PtfxName = "scr_bike_cfid_camera_flash",
            PtfxPlacement = {
                0.0,
                0.0,
                0.13,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = 'camera',
            PtfxWait = 200
        }
    },
    ["camera2"] = {
        "cellphone@female",
        "cellphone_text_read_base_cover_low",
        "Camera 2",
        AnimationOptions = {
            Prop = "prop_ing_camera_01",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.0300,
                0.0520,
                -172.0487,
                -163.9389,
                -29.0221
            },
            EmoteLoop = false,
            EmoteMoving = true,
            PtfxAsset = "scr_bike_business",
            PtfxName = "scr_bike_cfid_camera_flash",
            PtfxPlacement = {
                0.0,
                0.01,
                0.1,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = 'camera',
            PtfxWait = 200
        }
    },
    ["champagnespray"] = {
        "anim@mp_player_intupperspray_champagne",
        "idle_a",
        "Champagne Spray",
        AnimationOptions = {
            Prop = 'ba_prop_battle_champ_open',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteMoving = true,
            EmoteLoop = true,
            PtfxAsset = "scr_ba_club",
            PtfxName = "scr_ba_club_champagne_spray",
            PtfxPlacement = {
                -0.015,
                0.0,
                0.041,
                0.0,
                180,
                0.0,
                1.0
            },
            PtfxInfo = 'spraychamp',
            PtfxWait = 500,
            PtfxCanHold = true
        }
    },
    ["joint"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Joint",
        AnimationOptions = {
            Prop = 'p_cs_joint_02',
            PropBone = 47419,
            PropPlacement = {
                0.015,
                -0.009,
                0.003,
                55.0,
                0.0,
                110.0
            },
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["cig"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Cig",
        AnimationOptions = {
            Prop = 'prop_amb_ciggy_01',
            PropBone = 47419,
            PropPlacement = {
                0.015,
                -0.009,
                0.003,
                55.0,
                0.0,
                110.0
            },
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["brief"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Briefcase",
        AnimationOptions = {
            Prop = "prop_ld_case_01",
            PropBone = 57005,
            PropPlacement = {
                0.12,
                0.0,
                0.0,
                0.0,
                255.0,
                80.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["brief2"] = { -- Added for compatibility
        "missheistdocksprep1hold_cellphone",
        "static",
        "Briefcase 2",
        AnimationOptions =
        {
            Prop = "prop_ld_case_01",
            PropBone = 57005,
            PropPlacement = {
                0.10,
                0.0,
                0.0,
                0.0,
                280.0,
                53.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guncase"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guncase",
        AnimationOptions =
        {
            Prop = "prop_gun_case_01",
            PropBone = 57005,
            PropPlacement = {
                0.10,
                0.02,
                -0.02,
                40.0,
                145.0,
                115.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tablet"] = {
        "amb@world_human_tourist_map@male@base",
        "base",
        "Tablet",
        AnimationOptions = {
            Prop = "prop_cs_tablet",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                -0.03,
                0.0,
                20.0,
                -90.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tablet2"] = {
        "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a",
        "idle_a",
        "Tablet 2",
        AnimationOptions = {
            Prop = "prop_cs_tablet",
            PropBone = 28422,
            PropPlacement = {
                -0.05,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
     },
    ["tablet3"] = {
        "amb@world_human_tourist_map@male@base",
        "base",
        "Tablet",
        AnimationOptions = {
            Prop = "sf_prop_sf_tablet_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                -0.03,
                0.0,
                20.0,
                -90.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tablet4"] = {
        "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a",
        "idle_a",
        "Tablet 2",
        AnimationOptions = {
            Prop = "sf_prop_sf_tablet_01a",
            PropBone = 28422,
            PropPlacement = {
                -0.05,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["phonecall"] = {
        "cellphone@",
        "cellphone_call_listen_base",
        "Phone Call",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7},
            },
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["phonecall2"] = {
        "random@kidnap_girl",
        "ig_1_girl_on_phone_loop",
        "Phone Call 2",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7},
            },
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["wt"] = {
        "cellphone@",
        "cellphone_text_read_base",
        "Walkie Talkie",
        AnimationOptions = {
            Prop = "prop_cs_hand_radio",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
	-- ["wt2"] = {
    --     "cellphone@",
    --     "radio_holding_gun",
    --     "Walkie Talkie 2",
    --     AnimationOptions = {
    --         Prop = "prop_cs_hand_radio",
    --         PropBone = 60309,
    --         PropPlacement = {
    --             0.0750,
    --             0.0470,
    --             0.0110,
    --           -97.9442,
    --             3.7058,
    --             -23.2367
	-- 			},
    --         EmoteLoop = true,

    --     }
    -- },
    -- ["wt3"] = {
    --     "anim@radio_left",
    --     "radio_left_clip",
    --     "Walkie Talkie 3 Left",
    --     AnimationOptions = {
    --         Prop = "prop_cs_hand_radio",
    --         PropBone = 60309,
    --         PropPlacement = {
    --             0.0750,
    --             0.0470,
    --             0.0110,
    --           -97.9442,
    --             3.7058,
    --             -23.2367
	-- 			},
    --         EmoteLoop = true,
	-- 		EmoteMoving = true
    --     }
    -- },
    -- ["wt4"] = {
    --     "anim@male@holding_radio",
    --     "holding_radio_clip",
    --     "Walkie Talkie 4",
    --     AnimationOptions = {
    --         Prop = "prop_cs_hand_radio",
    --         PropBone = 28422,
    --         PropPlacement = {
    --             0.0750,
    --             0.0230,
    --            -0.0230,
    --           -90.0000,
    --             0.0,
    --           -59.9999
	-- 			},
    --         EmoteLoop = true,
	-- 		EmoteMoving = true
    --     }
    -- },
    ["clean"] = {
        "timetable@floyd@clean_kitchen@base",
        "base",
        "Clean",
        AnimationOptions = {
            Prop = "prop_sponge_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.01,
                90.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["clean2"] = {
        "amb@world_human_maid_clean@",
        "base",
        "Clean 2",
        AnimationOptions = {
            Prop = "prop_sponge_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.01,
                90.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["protest"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Protest",
        AnimationOptions = {
            Prop = "prop_cs_protest_sign_01",
            PropBone = 57005,
            PropPlacement = {
                0.1820,
                0.2400,
                0.0600,
                -69.3774235,
                5.9142048,
                -13.9572354
            },
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["binoculars"] = {
        "amb@world_human_binoculars@male@idle_b",
        "idle_f",
        "Binoculars",
        AnimationOptions = {
            Prop = "prop_binoc_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["binoculars2"] = {
        "amb@world_human_binoculars@male@idle_a",
        "idle_c",
        "Binoculars 2",
        AnimationOptions = {
            Prop = "prop_binoc_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tennisplay"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Tennis Play",
        AnimationOptions = {
            Prop = "prop_tennis_bag_01",
            PropBone = 57005,
            PropPlacement = {
                0.27,
                0.0,
                0.0,
                91.0,
                0.0,
                -82.9999951
            },
            SecondProp = 'prop_tennis_rack_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {
                0.0800,
                0.0300,
                0.0,
                -130.2907295,
                3.8782324,
                6.588224
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["weights"] = {
        "amb@world_human_muscle_free_weights@male@barbell@base",
        "base",
        "Weights",
        AnimationOptions = {
            Prop = "prop_curl_bar_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["weights2"] = {
        "amb@world_human_muscle_free_weights@male@barbell@idle_a",
        "idle_d",
        "Weights 2",
        AnimationOptions = {
            Prop = "prop_curl_bar_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["fuel"] = {
        "weapons@misc@jerrycan@",
        "fire",
        "Fuel",
        AnimationOptions = {
            Prop = "w_am_jerrycan",
            PropBone = 57005,
            PropPlacement = {
                0.1800,
                0.1300,
                -0.2400,
                -165.8693883,
                -11.2122753,
                -32.9453021
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["fuel2"] = {
        "weapons@misc@jerrycan@franklin",
        "idle",
        "Fuel 2 (Carry)",
        AnimationOptions = {
            Prop = "w_am_jerrycan",
            PropBone = 28422,
            PropPlacement = {
                0.26,
                0.050,
                0.0300,
                80.00,
                180.000,
                79.99
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["hitchhike"] = {
        "random@hitch_lift",
        "idle_f",
        "Hitchhike",
        AnimationOptions = {
            Prop = "w_am_jerrycan",
            PropBone = 18905,
            PropPlacement = {
                0.32,
                -0.0100,
                0.0,
                -162.423,
                74.83,
                58.79
            },
            SecondProp = 'prop_michael_backpack',
            SecondPropBone = 40269,
            SecondPropPlacement = {
                -0.07,
                -0.21,
                -0.11,
                -144.93,
                117.358,
                -6.16
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Stop Sign ",
        AnimationOptions = {
            Prop = "prop_sign_road_01a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign2"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Yield Sign ",
        AnimationOptions = {
            Prop = "prop_sign_road_02a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign3"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Hospital Sign ",
        AnimationOptions = {
            Prop = "prop_sign_road_03d",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign4"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Parking Sign ",
        AnimationOptions = {
            Prop = "prop_sign_road_04a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign5"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Parking Sign 2 ",
        AnimationOptions = {
            Prop = "prop_sign_road_04w",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign6"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Pedestrian Sign ",
        AnimationOptions = {
            Prop = "prop_sign_road_05a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign7"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Street Sign ",
        AnimationOptions = {
            Prop = "prop_sign_road_05t",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign8"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Freeway Sign ",
        AnimationOptions = {
            Prop = "prop_sign_freewayentrance",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["ssign9"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Stop Sign Snow ",
        AnimationOptions = {
            Prop = "prop_snow_sign_road_01a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["conehead"] = {
        "move_m@drunk@verydrunk_idles@",
        "fidget_07",
        "Cone Head ",
        AnimationOptions = {
            Prop = "prop_roadcone02b",
            PropBone = 31086,
            PropPlacement = {
                0.0500,
                0.0200,
                -0.000,
                30.0000004,
                90.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtraya"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_03",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.0400,
                -0.1390,
                20.0000007,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayb"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray B",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.0400,
                -0.1390,
                20.0000007,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayc"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray C",
        AnimationOptions = {
            Prop = "prop_food_cb_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.0400,
                -0.1390,
                20.0000007,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayd"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray D",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.0400,
                -0.1390,
                20.0000007,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtraye"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray E",
        AnimationOptions = {
            Prop = "prop_food_tray_03",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.0400,
                -0.1390,
                20.0000007,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayf"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray F",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_02",
            PropBone = 57005,
            PropPlacement = {
                0.2500,
                0.1000,
                0.0700,
                -110.5483936,
                73.3529273,
                -16.338362
            },
            SecondProp = 'prop_food_bs_tray_03',
            SecondPropBone = 18905,
            SecondPropPlacement = {
                0.2200,
                0.1300,
                -0.1000,
                -127.7725487,
                110.2074758,
                -3.5886263
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayg"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray G",
        AnimationOptions = {
            Prop = "prop_food_cb_tray_02",
            PropBone = 57005,
            PropPlacement = {
                0.2500,
                0.1000,
                0.0700,
                -110.5483936,
                73.3529273,
                -16.338362
            },
            SecondProp = 'prop_food_cb_tray_02',
            SecondPropBone = 18905,
            SecondPropPlacement = {
                0.2200,
                0.1300,
                -0.1000,
                -127.7725487,
                110.2074758,
                -3.5886263
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayh"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray H",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 57005,
            PropPlacement = {
                0.2500,
                0.1000,
                0.0700,
                -110.5483936,
                73.3529273,
                -16.338362
            },
            SecondProp = 'prop_food_tray_03',
            SecondPropBone = 18905,
            SecondPropPlacement = {
                0.2200,
                0.1300,
                -0.1000,
                -127.7725487,
                110.2074758,
                -3.5886263
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayi"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray I",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 57005,
            PropPlacement = {
                0.2500,
                0.1000,
                0.0700,
                -110.5483936,
                73.3529273,
                -16.338362
            },
            SecondProp = 'prop_food_tray_02',
            SecondPropBone = 18905,
            SecondPropPlacement = {
                0.2200,
                0.1300,
                -0.1000,
                -127.7725487,
                110.2074758,
                -3.5886263
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayj"] = {
        "anim@move_f@waitress",
        "idle",
        "Food Tray J",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayk"] = {
        "anim@move_f@waitress",
        "idle",
        "Food Tray K",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayl"] = {
        "anim@move_f@waitress",
        "idle",
        "Food Tray L",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_03",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtraym"] = {
        "anim@move_f@waitress",
        "idle",
        "Food Tray M",
        AnimationOptions = {
            Prop = "prop_food_cb_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayn"] = {
        "anim@move_f@waitress",
        "idle",
        "Food Tray N",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["foodtrayo"] = {
        "anim@move_f@waitress",
        "idle",
        "Food Tray O",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["carrypizza"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Pizza Box",
        AnimationOptions = {
            Prop = "prop_pizza_box_02",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.1000,
                -0.1590,
                20.0000007,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["carryfoodbag"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Carry Food Bag",
        AnimationOptions = {
            Prop = "prop_food_bs_bag_01",
            PropBone = 57005,
            PropPlacement = {
                0.3300,
                0.0,
                -0.0300,
                0.0017365,
                -79.9999997,
                110.0651988
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["carryfoodbag2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Carry Food Bag 2",
        AnimationOptions = {
            Prop = "prop_food_cb_bag_01",
            PropBone = 57005,
            PropPlacement = {
                0.3800,
                0.0,
                -0.0300,
                0.0017365,
                -79.9999997,
                110.0651988
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["carryfoodbag3"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Carry Food Bag 3",
        AnimationOptions = {
            Prop = "prop_food_bag1",
            PropBone = 57005,
            PropPlacement = {
                0.3800,
                0.0,
                -0.0300,
                0.0017365,
                -79.9999997,
                110.0651988
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tag"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@male@",
        "shake_can_male",
        "Tagging Shake Can Male",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0700,
                0.0017365,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tag2"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@heeled@",
        "shake_can_female",
        "Tagging Shake Can Female",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0700,
                0.0017365,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tag3"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@male@",
        "spray_can_var_01_male",
        "Tagging Male 1",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0700,
                0.0017365,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tag4"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@male@",
        "spray_can_var_02_male",
        "Tagging Male 2",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0700,
                0.0017365,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tag5"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@heeled@",
        "spray_can_var_01_female",
        "Tagging Female 1",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0700,
                0.0017365,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["tag6"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@heeled@",
        "spray_can_var_02_female",
        "Tagging Female 2",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0700,
                0.0017365,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["beans"] = {
        "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        "base_idle",
        "Beans",
        AnimationOptions = {
            Prop = "h4_prop_h4_caviar_tin_01a",
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0300,
                0.0100,
                0.0,
                0.0,
                0.0
            },
            SecondProp = 'h4_prop_h4_caviar_spoon_01a',
            SecondPropBone = 28422,
            SecondPropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["dinner"] = {
        "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        "base_idle",
        "Dinner",
        AnimationOptions = {
            Prop = "prop_cs_plate_01",
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            SecondProp = 'h4_prop_h4_caviar_spoon_01a',
            SecondPropBone = 28422,
            SecondPropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["newscam"] = {
        "missfinale_c2mcs_1",
        "fin_c2_mcs_1_camman",
        "News Camera",
        AnimationOptions = {
            Prop = "prop_v_cam_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0300,
                0.0100,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["newsmic"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "News Microphone",
        AnimationOptions = {
            Prop = "p_ing_microphonel_01",
            PropBone = 4154,
            PropPlacement = {
                -0.00,
                -0.0200,
                0.1100,
                0.00,
                0.0,
                60.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["newsbmic"] = {
        "missfra1",
        "mcs2_crew_idle_m_boom",
        "News Boom Microphone",
        AnimationOptions = {
            Prop = "prop_v_bmike_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leafblower"] = {
        "amb@world_human_gardener_leaf_blower@base",
        "base",
        "Leaf Blower",
        AnimationOptions = {
            Prop = "prop_leaf_blower_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
            PtfxAsset = "scr_armenian3",
            PtfxName = "ent_anim_leaf_blower",
            PtfxPlacement = {
                1.0,
                0.0,
                -0.25,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = 'useleafblower',
            PtfxWait = 2000,
            PtfxCanHold = true
        }
    },
    ["bbqf"] = {
        "amb@prop_human_bbq@male@idle_a",
        "idle_b",
        "BBQ (Female)",
        AnimationOptions = {
            Prop = "prop_fish_slice_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pump"] = {
        "missfbi4prepp1",
        "idle",
        "Pumpkin",
        AnimationOptions = {
            Prop = "prop_veg_crop_03_pump",
            PropBone = 28422,
            PropPlacement = {
                0.0200,
                0.0600,
                -0.1200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pump2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Pumpkin 2",
        AnimationOptions = {
            Prop = "prop_veg_crop_03_pump",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.16000,
                -0.2100,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pump3"] = {
        "missfbi4prepp1",
        "idle",
        "Pumpkin 3",
        AnimationOptions = {
            Prop = "reh_prop_reh_lantern_pk_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0010,
                0.0660,
                -0.0120,
                171.9169,
                179.8707,
                -39.9860
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pump4"] = {
        "missfbi4prepp1",
        "idle",
        "Pumpkin 4",
        AnimationOptions = {
            Prop = "reh_prop_reh_lantern_pk_01b",
            PropBone = 28422,
            PropPlacement = {
                0.0010,
                0.0660,
                -0.0120,
                171.9169,
                179.8707,
                -39.9860
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["pump5"] = {
        "missfbi4prepp1",
        "idle",
        "Pumpkin 5",
        AnimationOptions = {
            Prop = "reh_prop_reh_lantern_pk_01c",
            PropBone = 28422,
            PropPlacement = {
                0.0010,
                0.0660,
                -0.0120,
                171.9169,
                179.8707,
                -39.9860
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mop"] = {
        "missfbi4prepp1",
        "idle",
        "Mop",
        AnimationOptions = {
            Prop = "prop_cs_mop_s",
            PropBone = 28422,
            PropPlacement = {
                -0.0200,
                -0.0600,
                -0.2000,
                -13.377,
                10.3568,
                17.9681
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["mop2"] = {
        "move_mop",
        "idle_scrub_small_player",
        "Mop 2",
        AnimationOptions = {
            Prop = "prop_cs_mop_s",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.1200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jerkf"] = {
        "switch@trevor@jerking_off",
        "trev_jerking_off_loop",
        "JerkOff! Female",
        AnimationOptions = {
            Prop = 'prop_cs_dildo_01',
            PropBone = 28422,
            PropPlacement = {
                0.09,
                0.05,
                -0.03,
                90.0,
                80.0,
                30.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        },
        AdultAnimation = true
    },
    ["rake"] = {
        "anim@amb@drug_field_workers@rake@male_a@base",
        "base",
        "Rake",
        AnimationOptions = {
            Prop = "prop_tool_rake",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true
        }
    },
    ["rake2"] = {
        "anim@amb@drug_field_workers@rake@male_a@idles",
        "idle_b",
        "Rake 2",
        AnimationOptions = {
            Prop = "prop_tool_rake",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true
        }
    },
    ["rake3"] = {
        "anim@amb@drug_field_workers@rake@male_b@base",
        "base",
        "Rake 3",
        AnimationOptions = {
            Prop = "prop_tool_rake",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true
        }
    },
    ["rake4"] = {
        "anim@amb@drug_field_workers@rake@male_b@idles",
        "idle_d",
        "Rake 4",
        AnimationOptions = {
            Prop = "prop_tool_rake",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true
        }
    },
    ["broom"] = {
        "anim@amb@drug_field_workers@rake@male_a@base",
        "base",
        "Broom",
        AnimationOptions = {
            Prop = "prop_tool_broom",
            PropBone = 28422,
            PropPlacement = {
                -0.0100,
                0.0400,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true
        }
    },
    ["broom2"] = {
        "anim@amb@drug_field_workers@rake@male_a@idles",
        "idle_b",
        "Broom 2",
        AnimationOptions = {
            Prop = "prop_tool_broom",
            PropBone = 28422,
            PropPlacement = {
                -0.0100,
                0.0400,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true
        }
    },
    ["broom3"] = {
        "anim@amb@drug_field_workers@rake@male_b@base",
        "base",
        "Broom 3",
        AnimationOptions = {
            Prop = "prop_tool_broom",
            PropBone = 28422,
            PropPlacement = {
                -0.0100,
                0.0400,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true
        }
    },
    ["broom4"] = {
        "anim@amb@drug_field_workers@rake@male_b@idles",
        "idle_d",
        "Broom 4",
        AnimationOptions = {
            Prop = "prop_tool_broom",
            PropBone = 28422,
            PropPlacement = {
                -0.0100,
                0.0400,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true
        }
    },
    ["champw"] = {
        "anim@move_f@waitress",
        "idle",
        "Champagne Waiter",
        AnimationOptions = {
            Prop = "vw_prop_vw_tray_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0100,
                0.0,
                0.0,
                0.0
            },
            SecondProp = 'prop_champ_cool',
            SecondPropBone = 28422,
            SecondPropPlacement = {
                0.0,
                0.0,
                0.010,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["shit"] = {
        "missfbi3ig_0",
        "shit_loop_trev",
        "Shit",
        AnimationOptions = {
            Prop = "prop_toilet_roll_01",
            PropBone = 28422,
            PropPlacement = {
                0.0700,
                -0.02000,
                -0.2100,
                0,
                0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
            PtfxAsset = "scr_amb_chop",
            PtfxName = "ent_anim_dog_poo",
            PtfxNoProp = true,
            PtfxBone = 11816,
            PtfxPlacement = {
                0.0,
                0.0,
                -0.1,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = 'poop',
            PtfxWait = 200,
            PtfxCanHold = true
        }
    },
    ["puke"] = {
        "missheistpaletoscore1leadinout",
        "trv_puking_leadout",
        "Puke",
        AnimationOptions = {
            EmoteLoop = false,
            EmoteMoving = true,
            PtfxAsset = "scr_paletoscore",
            PtfxName = "scr_trev_puke",
            PtfxNoProp = true,
            PtfxBone = 31086,
            PtfxPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = 'puke',
            PtfxWait = 200,
            PtfxCanHold = true
        },
    },
    ["puke2"] = {
        "anim@scripted@ulp_missions@injured_agent@",
        "idle",
        "Puke 2",
        AnimationOptions = {
            EmoteLoop = true,
            PtfxAsset = "scr_paletoscore",
            PtfxName = "scr_trev_puke",
            PtfxNoProp = true,
            PtfxBone = 31086,
            PtfxPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = 'puke',
            PtfxWait = 200,
            PtfxCanHold = true
        },
    },
    ["puke3"] = {
        "anim@scripted@freemode@throw_up_toilet@male@",
        "vomit",
        "Puke 3",
        AnimationOptions = {
            EmoteLoop = true,
            PtfxAsset = "scr_paletoscore",
            PtfxName = "scr_trev_puke",
            PtfxNoProp = true,
            PtfxBone = 31086,
            PtfxPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = 'puke',
            PtfxWait = 200,
            PtfxCanHold = true
        },
    },
    ["selfie"] = {
        "anim@mp_player_intuppertake_selfie",
        "idle_a",
        "Selfie",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7}
            },
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfie2"] = {
        "cellphone@self@franklin@",
        "peace",
        "Selfie 2",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7}
            },
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfie3"] = {
        "cellphone@self@franklin@",
        "west_coast",
        "Selfie 3 - West Side",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7}
            },
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfie4"] = {
        "cellphone@self@trevor@",
        "aggressive_finger",
        "Selfie 4 - Finger",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7}
            },
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfie5"] = {
        "cellphone@self@trevor@",
        "proud_finger",
        "Selfie 5 - Finger 2",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7},
            },
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfie6"] = {
        "cellphone@self@trevor@",
        "throat_slit",
        "Selfie 6 - Throat Slit",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7}
            },
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["selfie7"] = {
        "cellphone@self@franklin@",
        "chest_bump",
        "Selfie 7 - Chest Bump",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7}
            },
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sittv"] = {
        "anim@heists@heist_safehouse_intro@variations@male@tv",
        "tv_part_one_loop",
        "Sit TV",
        AnimationOptions = {
            Prop = "v_res_tre_remote",
            PropBone = 57005,
            PropPlacement = {
                0.0990,
                0.0170,
                -0.0300,
                -64.760,
                -109.544,
                18.717
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["dig"] = {
        "random@burial",
        "a_burial",
        "Dig",
        AnimationOptions = {
            Prop = "prop_tool_shovel",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.24,
                0,
                0,
                0.0,
                0.0
            },
            SecondProp = 'prop_ld_shovel_dirt',
            SecondPropBone = 28422,
            SecondPropPlacement = {
                0.0,
                0.0,
                0.24,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["bongos"] = {
        "amb@world_human_musician@bongos@male@base",
        "base",
        "Bongo Drums",
        AnimationOptions = {
            Prop = "prop_bongos_01",
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["medbag"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Medic Bag",
        AnimationOptions = {
            Prop = "xm_prop_x17_bag_med_01a",
            PropBone = 57005,
            PropPlacement = {
                0.3900,
                -0.0600,
                -0.0600,
                -100.00,
                -180.00,
                -78.00
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["dufbag"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Duffel Bag",
        AnimationOptions = {
            Prop = "bkr_prop_duffel_bag_01a",
            PropBone = 28422,
            PropPlacement = {
                0.2600,
                0.0400,
                0.00,
                90.00,
                0.00,
                -78.99
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["shopbag"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Shopping Bag",
        AnimationOptions = {
            Prop = "vw_prop_casino_shopping_bag_01a",
            PropBone = 28422,
            PropPlacement = {
                0.24,
                0.03,
                -0.04,
                0.00,
                -90.00,
                10.00
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["shopbag2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Shopping Bag 2",
        AnimationOptions = {
            Prop = "prop_shopping_bags02",
            PropBone = 28422,
            PropPlacement = {
                0.05,
                0.02,
                0.00,
                178.80,
                91.19,
                9.97
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["shopbag3"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Shopping Bag 3",
        AnimationOptions = {
            Prop = "prop_cs_shopping_bag",
            PropBone = 28422,
            PropPlacement = {
                0.24,
                0.03,
                -0.04,
                0.00,
                -90.00,
                10.00
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['shopbag4'] = {
        'chocoholic@single54',
        'single54_clip',
        'Shopping Bag 4',
        AnimationOptions = {
            Prop = 'prop_carrier_bag_01',
            PropBone = 28422,
            PropPlacement = {
                0.2280,
                0.0070,
               -0.1230,
                1.2556,
               -53.8020,
               -34.4621
            },
            SecondProp = 'prop_phone_proto',
            PropTextureVariations = {
                { Name = "<font color=\"#00A0F4\">Blue", Value = 0 },
                { Name = "<font color=\"#1AA20E\">Green", Value = 1 },
                { Name = "<font color=\"#800B0B\">Dark Red", Value = 2 },
                { Name = "<font color=\"#FF7B00\">Orange", Value = 3 },
                { Name = "<font color=\"#5F5F5F\">Grey", Value = 4 },
                { Name = "<font color=\"#a356fa\">Purple", Value = 5 },
                { Name = "<font color=\"#FF0099\">Pink", Value = 6 },
                { Name = "Black", Value = 7 }
            },
            SecondPropBone = 60309, -- Left Wrist
            SecondPropPlacement = {
                0.0910,
                0.0410,
               -0.0040,
               -129.2433,
               -18.1966,
               -41.2633
            },
            PtfxAsset = "scr_tn_meet",
            PtfxName = "scr_tn_meet_phone_camera_flash",
            PtfxPlacement = {
                -0.015,
                0.0,
                0.041,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = 'camera',
            PtfxWait = 200,
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["guccibag"] = { -- Custom prop by crowded1337, unbranded by TayMcKenzieNZ
        "move_weapon@jerrycan@generic",
        "idle",
        "Gucci Bag",
        AnimationOptions = {
            Prop = 'prop_amb_handbag_01',
            PropBone = 28422, -- Right Wrist
            PropPlacement = {
                0.2000,
                0.0300,
                -0.0200,
                90.4294,
                -177.4267,
                83.0011
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["idcard"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 1",
        AnimationOptions = {
            Prop = "prop_franklin_dl",
            PropBone = 57005,
            PropPlacement = {
                0.1000,
                0.0200,
               -0.0300,
              -90.000,
              170.000,
               78.999
            },
            EmoteStuck = true,
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["idcardb"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 2 - FIB",
        AnimationOptions = {
            Prop = "prop_fib_badge",
            PropBone = 28422,
            PropPlacement = {
                0.0600,
                0.0210,
               -0.0400,
              -90.00,
             -180.00,
               78.999
            },
            EmoteStuck = true,
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["idcardc"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 3",
        AnimationOptions = {
            Prop = "prop_michael_sec_id",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
               -0.0300,
              -90.00,
             -180.00,
               78.999
            },
            EmoteStuck = true,
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["idcardd"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 4",
        AnimationOptions = {
            Prop = "prop_trev_sec_id",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.00,
                -180.00,
                78.999
            },
            EmoteStuck = true,
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["idcarde"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 5",
        AnimationOptions = {
            Prop = "p_ld_id_card_002",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.00,
                -180.00,
                78.999
            },
            EmoteStuck = true,
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["idcardf"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 6",
        AnimationOptions = {
            Prop = "prop_cs_r_business_card",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.00,
                -180.00,
                78.999
            },
            EmoteStuck = true,
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["idcardg"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 7",
        AnimationOptions = {
            Prop = "prop_michael_sec_id",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.00,
                -180.00,
                78.999
            },
            EmoteStuck = true,
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["idcardh"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 8",
        AnimationOptions = {
            Prop = "prop_cop_badge",
            PropBone = 28422,
            PropPlacement = {
                0.0800,
               -0.0120,
               -0.0600,
              -90.00,
              180.00,
               69.99
            },
            EmoteStuck = true,
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["idcardi"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 9 - Drivers License",
        AnimationOptions = {
            Prop = "bkr_prop_fakeid_singledriverl",
            PropBone = 28422,
            PropPlacement = {
                0.0700,
                0.0260,
               -0.0320,
               -10.8683,
              -177.8499,
                23.6377
            },
            EmoteStuck = true,
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["idcardj"] = {
        "amb@code_human_wander_clipboard@male@base",
        "static",
        "ID Card 10 - Passport",
        AnimationOptions = {
            Prop = "bkr_prop_fakeid_openpassport",
            PropBone = 60309,
            PropPlacement = {
                -0.0230,
                 0.0330,
                -0.0600,
               -80.7083,
                90.8670,
                41.4814
            },
            EmoteStuck = true,
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["phone"] = {
        "cellphone@",
        "cellphone_text_read_base",
        "Phone",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7}
            },
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sms"] = {
        "cellphone@",
        "cellphone_text_read_base",
        "SMS",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7}
            },
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sms2"] = {
        "cellphone@female",
        "cellphone_text_read_base",
        "SMS 2",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7}
            },
            PropBone = 28422,
            PropPlacement = {
                0.00,
                0.00,
                0.0301,
                0.000,
                00.00,
                00.00
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["sms3"] = {
        "cellphone@female",
        "cellphone_email_read_base",
        "SMS 3",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7}
            },
            PropBone = 28422,
            PropPlacement = {
                -0.0190,
                -0.0240,
                0.0300,
                18.99,
                -72.07,
                6.39
            },
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["sms4"] = {
        "cellphone@female",
        "cellphone_text_read_base_cover_low",
        "SMS 4",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7}
            },
            PropBone = 28422,
            PropPlacement = {
                -0.0190,
                -0.0250,
                0.0400,
                19.17,
                -78.50,
                14.97
            },
            EmoteLoop = false,
            EmoteMoving = true,
            PtfxAsset = "scr_tn_meet",
            PtfxName = "scr_tn_meet_phone_camera_flash",
            PtfxPlacement = {
                -0.015,
                0.0,
                0.041,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = 'camera',
            PtfxWait = 200
        }
    },
    ["sms5"] = {
        "amb@code_human_wander_texting_fat@male@base",
        "static",
        "SMS 5",
        AnimationOptions = {
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7}
            },
            PropBone = 28422,
            PropPlacement = {
                -0.0200,
                -0.0100,
                0.00,
                2.309,
                88.845,
                29.979
            },
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["tire"] = {
        "anim@heists@box_carry@",
        "idle",
        "Tire",
        AnimationOptions = {
            Prop = "prop_wheel_tyre",
            PropBone = 60309,
            PropPlacement = {
                -0.05,
                0.16,
                0.32,
                -130.0,
                -55.0,
                150.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["golfswing"] = {
        "rcmnigel1d",
        "swing_a_mark",
        "Golf Swing",
        AnimationOptions = {
            EmoteLoop = true,
            Prop = "prop_golf_wood_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            }
        }
    },
    ["register"] = {
        "anim@heists@box_carry@",
        "idle",
        "Register",
        AnimationOptions = {
            Prop = "v_ret_gc_cashreg",
            PropBone = 60309,
            PropPlacement = {
                0.138,
                0.2,
                0.2,
                -50.0,
                290.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["weedbrick"] = {
        "impexp_int-0",
        "mp_m_waremech_01_dual-0",
        "Weed Brick",
        AnimationOptions = {
            Prop = "prop_weed_block_01",
            PropBone = 60309,
            PropPlacement = {
                0.1,
                0.1,
                0.05,
                0.0,
                -90.0,
                90.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["weedbrick2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Weed Brick BIG",
        AnimationOptions = {
            Prop = "bkr_prop_weed_bigbag_01a",
            PropBone = 60309,
            PropPlacement = {
                0.158,
                -0.05,
                0.23,
                -50.0,
                290.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["potplant"] = {
        "anim@heists@box_carry@",
        "idle",
        "Pot Plant (Small)",
        AnimationOptions = {
            Prop = "bkr_prop_weed_01_small_01c",
            PropBone = 60309,
            PropPlacement = {
                0.138,
                -0.05,
                0.23,
                -50.0,
                290.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["potplant2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Pot Plant (Medium)",
        AnimationOptions = {
            Prop = "bkr_prop_weed_01_small_01b",
            PropBone = 60309,
            PropPlacement = {
                0.138,
                -0.05,
                0.23,
                -50.0,
                290.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["potplant3"] = {
        "anim@heists@box_carry@",
        "idle",
        "Pot Plant (Large)",
        AnimationOptions = {
            Prop = "bkr_prop_weed_lrg_01b",
            PropBone = 60309,
            PropPlacement = {
                0.138,
                -0.05,
                0.23,
                -50.0,
                290.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["weedbucket"] = {
        "anim@heists@box_carry@",
        "idle",
        "Weed Bucket",
        AnimationOptions = {
            Prop = "bkr_prop_weed_bucket_open_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                -0.1000,
                -0.1800,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["lawnchair"] = {
        "timetable@ron@ig_5_p3",
        "ig_5_p3_base",
        "Lawnchair",
        AnimationOptions = {
            Prop = "prop_skid_chair_02",
            PropBone = 0,
            PropPlacement = {
                0.025,
                -0.2,
                -0.1,
                45.0,
                -5.0,
                180.0
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["lawnchair2"] = {
        "timetable@reunited@ig_10",
        "base_amanda",
        "Lawnchair 2",
        AnimationOptions = {
            Prop = "prop_skid_chair_02",
            PropBone = 0,
            PropPlacement = {
                0.025,
                -0.15,
                -0.1,
                45.0,
                5.0,
                180.0
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["lawnchair3"] = {
        "timetable@ron@ig_3_couch",
        "base",
        "Lawnchair 3",
        AnimationOptions = {
            Prop = "prop_skid_chair_02",
            PropBone = 0,
            PropPlacement = {
                -0.05,
                0.0,
                -0.2,
                5.0,
                0.0,
                180.0
            },
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["rose2"] = {
        "missheistdocksprep1hold_cellphone",
        "static",
        "Rose 2 (Male)",
        AnimationOptions = {
            Prop = "prop_single_rose",
            PropBone = 31086,
            PropPlacement = {
                -0.0140,
                0.1030,
                0.0620,
                -2.932,
                4.564,
                39.910
            },
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["rose3"] = {
        "missheistdocksprep1hold_cellphone",
        "static",
        "Rose 3 (Female)",
        AnimationOptions = {
            Prop = "prop_single_rose",
            PropBone = 31086,
            PropPlacement = {
                -0.0140,
                0.1070,
                0.0720,
                0.00,
                0.00,
                2.99
            },
            EmoteLoop = false,
            EmoteMoving = true
        }
    },
    ["cbbox"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Beer Box",
        AnimationOptions = {
            Prop = "v_ret_ml_beerben1",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cbbox2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Beer Box 2",
        AnimationOptions = {
            Prop = "v_ret_ml_beerbla1",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cbbox3"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Beer Box 3",
        AnimationOptions = {
            Prop = "v_ret_ml_beerjak1",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cbbox4"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Beer Box 4",
        AnimationOptions = {
            Prop = "v_ret_ml_beerlog1",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cbbox5"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Beer Box 5",
        AnimationOptions = {
            Prop = "v_ret_ml_beerpis1",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cbbox6"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Beer Box 6",
        AnimationOptions = {
            Prop = "prop_beer_box_01",
            PropBone = 28422,
            PropPlacement = {
                0.0200,
                -0.0600,
                -0.1200,
                -180.00,
                -180.00,
                1.99
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gbin"] = {
        "anim@heists@box_carry@",
        "idle",
        "Garbage Bin",
        AnimationOptions = {
            Prop = "prop_bin_08open",
            PropBone = 28422,
            PropPlacement = {
                0.00,
                -0.420,
                -1.290,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gbin2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Garbage Bin 2",
        AnimationOptions = {
            Prop = "prop_cs_bin_01",
            PropBone = 28422,
            PropPlacement = {
                0.00,
                -0.420,
                -1.290,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gbin3"] = {
        "anim@heists@box_carry@",
        "idle",
        "Garbage Bin 3",
        AnimationOptions = {
            Prop = "prop_cs_bin_03",
            PropBone = 28422,
            PropPlacement = {
                0.00,
                -0.420,
                -1.290,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gbin4"] = {
        "anim@heists@box_carry@",
        "idle",
        "Garbage Bin 4",
        AnimationOptions = {
            Prop = "prop_bin_08a",
            PropBone = 28422,
            PropPlacement = {
                0.00,
                -0.420,
                -1.290,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["gbin5"] = {
        "anim@heists@box_carry@",
        "idle",
        "Garbage Bin 5",
        AnimationOptions = {
            Prop = "prop_bin_07d",
            PropBone = 28422,
            PropPlacement = {
                -0.0100,
                -0.2200,
                -0.8600,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['old'] = {
        'missbigscore2aleadinout@bs_2a_2b_int',
        'lester_base_idle',
        'Old Man Walking Stick',
        AnimationOptions = {
            Prop = 'prop_cs_walking_stick',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            SecondProp = 'prop_phone_proto',
            PropTextureVariations = {
                { Name = "<font color=\"#00A0F4\">Blue", Value = 0 },
                { Name = "<font color=\"#1AA20E\">Green", Value = 1 },
                { Name = "<font color=\"#800B0B\">Dark Red", Value = 2 },
                { Name = "<font color=\"#FF7B00\">Orange", Value = 3 },
                { Name = "<font color=\"#5F5F5F\">Grey", Value = 4 },
                { Name = "<font color=\"#a356fa\">Purple", Value = 5 },
                { Name = "<font color=\"#FF0099\">Pink", Value = 6 },
                { Name = "Black", Value = 7 },
            },
            SecondPropBone = 60309, -- Left Wrist
            SecondPropPlacement = {
                0.0740,
                0.0410,
                0.0090,
             -127.9136,
              -10.6186,
                4.7536
            },
            PtfxAsset = "scr_tn_meet",
            PtfxName = "scr_tn_meet_phone_camera_flash",
            PtfxPlacement = {
                -0.015,
                0.0,
                0.041,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = 'camera',
            PtfxWait = 200,
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['digiscan'] = {
        'weapons@misc@digi_scanner',
        'aim_med_loop',
        'Digiscan 1 ',
        AnimationOptions = {
            Prop = 'w_am_digiscanner',
            PropBone = 28422,
            PropPlacement = {
                0.0480,
                0.0780,
                0.0040,
                -81.6893,
                2.5616,
                -15.7909
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['digiscan2'] = {
        'weapons@misc@digi_scanner',
        'aim_low_loop',
        'Digiscan 2 ',
        AnimationOptions = {
            Prop = 'w_am_digiscanner',
            PropBone = 28422,
            PropPlacement = {
                0.0480,
                0.0780,
                0.0040,
                -81.6893,
                2.5616,
                -15.7909
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['digiscan3'] = {
        'weapons@misc@digi_scanner',
        'aim_high_loop',
        'Digiscan 3 ',
        AnimationOptions = {
            Prop = 'w_am_digiscanner',
            PropBone = 28422,
            PropPlacement = {
                0.0480,
                0.0780,
                0.0040,
                -81.6893,
                2.5616,
                -15.7909
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cop4"] = {
        "amb@world_human_car_park_attendant@male@base",
        "base",
        "Cop 4",
        AnimationOptions = {
            Prop = "prop_parking_wand_01",
            PropBone = 57005,
            PropPlacement = {
                0.12,
                0.05,
                0.0,
                80.0,
                -20.0,
                180.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["copbeacon"] = { -- Added for compatibility
        "amb@world_human_car_park_attendant@male@base",
        "base",
        "Cop Beacon",
        AnimationOptions = {
            Prop = "prop_parking_wand_01",
            PropBone = 57005,
            PropPlacement = {
                0.12,
                0.05,
                0.0,
                80.0,
                -20.0,
                180.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["leanphone"] = {
        "amb@world_human_leaning@male@wall@back@mobile@base",
        "base",
        "Leaning With Phone",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Prop = "prop_phone_proto",
            PropTextureVariations = {
                {Name = "<font color=\"#00A0F4\">Blue", Value = 0},
                {Name = "<font color=\"#1AA20E\">Green", Value = 1},
                {Name = "<font color=\"#800B0B\">Dark Red", Value = 2},
                {Name = "<font color=\"#FF7B00\">Orange", Value = 3},
                {Name = "<font color=\"#5F5F5F\">Grey", Value = 4},
                {Name = "<font color=\"#a356fa\">Purple", Value = 5},
                {Name = "<font color=\"#FF0099\">Pink", Value = 6},
                {Name = "Black", Value = 7}
            },
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            }
        }
    },
    ["hump2"] = {
        "timetable@trevor@skull_loving_bear",
        "skull_loving_bear",
        "Hump (Bear)",
        AnimationOptions = {
            Prop = 'prop_mr_raspberry_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteMoving = false,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["eat"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Eat",
        AnimationOptions = {
            Prop = 'prop_cs_burger_01',
            PropBone = 18905,
            PropPlacement = {
                0.13,
                0.05,
                0.02,
                -50.0,
                16.0,
                60.0
            },
            EmoteMoving = true
        }
    },
    ["drink"] = {
        "mp_player_intdrink",
        "loop_bottle",
        "Drink",
        AnimationOptions =
        {
            Prop = "prop_ld_flow_bottle",
            PropBone = 18905,
            PropPlacement = {
                0.12,
                0.008,
                0.03,
                240.0,
                -60.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["cashcase"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Cash Briefcase",
        AnimationOptions = {
            Prop = "bkr_prop_biker_case_shut",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0100,
                0.0040,
                0.0,
                0.0,
                -90.00
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cashcase2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Cash Briefcase 2",
        AnimationOptions = {
            Prop = "prop_cash_case_01",
            PropBone = 28422,
            PropPlacement = {
                -0.0050,
                -0.1870,
                -0.1400,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cashcase3"] = {
        "anim@heists@box_carry@",
        "idle",
        "Cash Briefcase 3",
        AnimationOptions = {
            Prop = "prop_cash_case_02",
            PropBone = 28422,
            PropPlacement = {
                0.0050,
                -0.1170,
                -0.1400,
                14.000,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cashcase4"] = {
        "anim@heists@box_carry@",
        "idle",
        "Cash Briefcase 4 - Diamonds",
        AnimationOptions = {
            Prop = "ch_prop_ch_security_case_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                -0.0900,
                -0.1800,
                14.4000,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["airportbag"] = {
        "anim@heists@narcotics@trash",
        "idle",
        "Airport Bag",
        AnimationOptions = {
            Prop = "prop_suitcase_01c",
            PropBone = 28422,
            PropPlacement = {
                0.1100,
                -0.2100,
                -0.4300,
                -11.8999,
                0.0,
                30.0000
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["watchstripper2"] = {
        "amb@world_human_strip_watch_stand@male_c@base",
        "base",
        "Watch Stripper 2",
        AnimationOptions = {
            Prop = "prop_beer_am",
            PropBone = 60309,
            PropPlacement = {
                0.0880,
                -0.1360,
                0.1450,
                -102.9624,
                81.7098,
                -39.2734
            },
            EmoteLoop = true,
            EmoteMoving = true
        },
        AdultAnimation = true
    },
    ["crackhead"] = {
        "special_ped@zombie@base",
        "base",
        "Crack Head",
        AnimationOptions = {
            Prop = 'prop_cs_bowie_knife', -- Knife
            PropBone = 28422, -- Right Wrist
            PropPlacement = {
                -0.1280,
                -0.0220,
                 0.0210,
                -150.0005,
                179.9989,
                -30.0105
            },
            SecondProp = 'ng_proc_cigpak01a',
            SecondPropBone = 26614,
            SecondPropPlacement = {
                0.010,
                -0.0190,
                0.0920,
                -82.4073,
                178.6009,
                29.9195
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["holdfw"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Hold Firework",
        AnimationOptions = {
            Prop = 'ind_prop_firework_01', --- blue, green, red, purple pink, cyan, yellow, white
             PtfxColor = {{R = 255, G = 0, B = 0, A = 1.0}, {R = 0, G = 255, B = 0, A = 1.0}, {R = 0, G = 0, B = 255, A = 1.0}, {R = 177, G = 5, B = 245, A = 1.0}, {R = 251, G = 3, B = 255, A = 1.0}, {R = 2, G = 238, B = 250, A = 1.0}, {R = 252, G = 248, B = 0, A = 1.0}, {R = 245, G = 245, B = 245, A = 1.0}},
            PropBone = 18905,
            PropPlacement = {
                0.1100,
                0.3200,
               -0.2400,
               -130.0688,
               -2.5736,
               -3.0631
            },
            EmoteLoop = true,
            EmoteMoving = true,
            PtfxAsset = "scr_indep_fireworks",
            PtfxName = "scr_indep_firework_trail_spawn",
            PtfxPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.6
            },
            PtfxInfo = 'firework',
            PtfxWait = 200
        }
    },
    ["patrolf1"] = {
        "amb@world_human_security_shine_torch@male@base",
        "base",
        "Patrol - On Foot",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 60309,
            PropPlacement = {
               0.0,
               0.0,
               0.0,
               0.0,
               0.0,
               80.0000
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["patrolf2"] = {
        "amb@world_human_security_shine_torch@male@idle_b",
        "idle_e",
        "Patrol - On Foot 2",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 60309,
            PropPlacement = {
               0.0,
               0.0,
               0.0,
               0.0,
               0.0,
               80.0000
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["patrolf3"] = {
        "amb@world_human_security_shine_torch@male@idle_a",
        "idle_a",
        "Patrol - On Foot 3",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 60309,
            PropPlacement = {
               0.0,
               0.0,
               0.0,
               0.0,
               0.0,
               80.0000
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["patrolf4"] = { -- Huge thanks to MadsLeander on GitHub
        "amb@incar@male@patrol@torch@base",
        "base",
        "Patrol - On Foot 4 Over The Shoulder",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 28422, -- Right Wrist
            PropPlacement = {
                0.0,
               -0.00100,
                0.0,
                0.0,
                0.0,
                90.0
            },
            SecondProp = 'prop_cs_hand_radio',
            SecondPropBone = 60309, -- Left Wrist
            SecondPropPlacement = {
                0.0560,
                0.0470,
                0.0110,
              -43.82733,
              164.6747,
               -7.5569
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["patrolcar"] = {
        "amb@incar@male@patrol@torch@base",
        "base",
        "Patrol Car - Front",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 28422,
            PropPlacement = {
               0.0,
              -0.0100,
              -0.0100,
               0.0,
               0.0,
             100.0000
            },
            EmoteLoop = true
        }
    },
    ["pineapple"] = { -- Custom Prop by hollywoodiownu
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Pineapple",
        AnimationOptions = {
            Prop = "xm3_prop_xm3_pineapple_01a",
            PropBone = 18905,
            PropPlacement = {
                0.1,
                -0.11,
                0.05,
                -100.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        },
    },
    ["present"] = {
        "anim@heists@box_carry@",
        "idle",
        "Present",
        AnimationOptions = {
            Prop = "xm3_prop_xm3_present_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                -0.18,
                -0.16,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["patrolcarl"] = {
        "amb@incar@male@patrol@torch@idle_b",
        "idle_d",
        "Patrol Car - Left",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 28422,
            PropPlacement = {
               0.0,
              -0.0100,
              -0.0100,
               0.0,
               0.0,
             100.0000
            },
            EmoteLoop = true
        }
    },
    ["patrolcarr"] = {
        "amb@incar@male@patrol@torch@idle_a",
        "idle_a",
        "Patrol Car - Right",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 28422,
            PropPlacement = {
               0.0,
              -0.0100,
              -0.0100,
               0.0,
               0.0,
             100.0000
            },
            EmoteLoop = true
        }
    },
    ["papers"] = {
        "missheistdocksprep1hold_cellphone",
        "static",
        "Papers",
        AnimationOptions = {
            Prop = "xm3_prop_xm3_papers_01a",
            PropBone = 18905,
            PropPlacement = {
                0.13,
                0.0,
                0.04,
                -110.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["vlog"] = {
        "amb@world_human_mobile_film_shocking@male@base",
        "base",
        "Vlog",
        AnimationOptions = {
            Prop = 'prop_ing_camera_01',
            PropBone = 28422,
            PropPlacement = {
               -0.07,
               -0.01,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["vlog2"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Vlog 2",
        AnimationOptions = {
            Prop = 'prop_ing_camera_01',
            PropBone = 18905,
            PropPlacement = {
               0.15,
               0.03,
               0.1,
             280.0,
             110.0,
             -11.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["shield"] = {
        "beachanims@molly",
        "beachanim_surf_clip",
        "Shield",
        AnimationOptions = {
            Prop = "prop_riot_shield",
            PropBone = 18905,
            PropPlacement = {
                -0.04,
                -0.06,
                0.0,
                4.04,
                108.17,
                -17.48
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["shield2"] = {
        "beachanims@molly",
        "beachanim_surf_clip",
        "Shield 2",
        AnimationOptions = {
            Prop = "prop_ballistic_shield",
            PropBone = 18905,
            PropPlacement = {
                0.01,
                -0.1,
                -0.07,
                1.83,
                105.38,
                -10.14
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
	["holster6"] = {
        "anim@hlstr_7360_torch",
        "flsh_ps",
        "Holster 6 - Flash Light",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 60309,
            PropPlacement = {
                0.0550,
               -0.0200,
                0.0370,
              -29.6216,
               -8.6822,
                4.9809
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["holster8"] = {
        "anim@holster_walk_torch",
        "flash_ps",
        "Holster 8 Flashlight 2",
        AnimationOptions = {
            Prop = 'prop_cs_police_torch_02',
            PropBone = 60309,
            PropPlacement = {
                0.0600,
               -0.0100,
                0.0200,
              -20.0000,
               0.0000,
               3.9999
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
}

local dance_list = {
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^5", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^1", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^4", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^6", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_phone^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_phone^2", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_vape_01^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_phone^1", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_phone", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^4", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^3_face"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^5_face"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^3_face"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^6_face"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "vehicleweapons_tula"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "intro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "outro", disabled = true},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "intro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "intro", disabled = true},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "intro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_left_down", disabled = true},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "intro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "intro", disabled = true},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_d_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_d_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_f_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_e_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_drop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_drop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_d_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_f1", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_drop_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_d_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_e_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_to_mi_drop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_f_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_e_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_e_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_d_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_f_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_d_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_si_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_e_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_f_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_e_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_ba_prop_battle_vape_01^heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v2_prop_npc_phone^heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v2_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_ba_prop_battle_vape_01^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v2_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_17_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v1_prop_npc_phone"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v1_ba_prop_battle_vape_01"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v1_prop_npc_phone"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v1_prop_npc_phone", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_li_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1ba_prop_battle_vape_01^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1ba_prop_battle_vape_01^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1ba_prop_battle_vape_01^flat^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1ba_prop_battle_vape_01^heel^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_prop_npc_phone^flat", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_prop_npc_phone^heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_prop_npc_phone^flat", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_prop_npc_phone^heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_vape"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_mobile"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_mobile_heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_gropub_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_gropub_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_vap_heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_vape_heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^1"},
}
local prop_list = {
    ["Backpack1"] = {
        Prop = 'sf_prop_sf_backpack_03a',
        PropBone = 24818,
        PropPlacement =  {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
        Used = {},
        Use = false
    },
    ["Backpack2"] = {
        Prop = 'p_michael_backpack_s',
        PropBone = 24818,
        PropPlacement =  {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
        Used = {},
        Use = false
    },
    ["Wings"] = {
        Prop = 'vw_prop_art_wings_01a',
        PropBone = 24818,
        PropPlacement =  {-1.4, -0.2, 0.0, 0.0, 90.0, 175.0},
        Used = {},
        Use = false
    },
    

}
--

local AnimationDuration = -1
local ChosenAnimation = ""
local ChosenDict = ""
local ChosenAnimOptions = false
local MovementType = 0
local PlayerGender = "male"
local PlayerHasProp = false
local PlayerProps = {}
local PlayerParticles = {}
local CurrentAnimation = {}
local SecondPropEmote = false
local PtfxNotif = false
local PtfxPrompt = false
local PtfxWait = 500
local PtfxCanHold = false
local PtfxNoProp = false
local AnimationThreadStatus = false
local CanCancel = true
local InExitEmote = false
local IsInAnimation = false
local isCrouched = false
local isHansUp = false


--function

local function notify(message)
    HUD.BEGIN_TEXT_COMMAND_THEFEED_POST("STRING")
    HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(message)
    HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(0, 1)
end

local function loadAnimation(dict)
    while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do
        STREAMING.REQUEST_ANIM_DICT(dict)
        util.yield()
    end
end

local function playerIsMale()
    if ENTITY.GET_ENTITY_MODEL(PLAYER.PLAYER_PED_ID()) == util.joaat("mp_m_freemode_01") then
        return true
    else 
        return false
    end
end

local function addProps(model, bone, off1, off2, off3, rot1, rot2, rot3, localSave)
    local playerPed = PLAYER.PLAYER_PED_ID()
    local playerCoord = ENTITY.GET_ENTITY_COORDS(playerPed)
    model = util.joaat(model)
    if not STREAMING.HAS_MODEL_LOADED(model) then
        STREAMING.REQUEST_MODEL(model)
        while not STREAMING.HAS_MODEL_LOADED(model) do 
            util.yield()
        end
    end
    playerCoord.z = playerCoord.z+0.2
    local prop = entities.create_object(model, playerCoord)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(prop, playerPed, PED.GET_PED_BONE_INDEX(playerPed, bone), off1 or 0.0, off2 or 0.0, off3 or 0.0, rot1 or 0.0, rot2 or 0.0, rot3 or 0.0, true, true, false, true, 1, true)
    table.insert(localSave, prop)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(model)
    PlayerHasProp = true
end

local function clearProps(prop)
    for i=1, #prop do
        local ent = prop[i]
        if ENTITY.DOES_ENTITY_EXIST(ent) then
            if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) then
                NETWORK.REQUEST_CONTROL_OF_ENTITY(ent)
                while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) do 
                    util.yield()
                end
            end
            entities.delete_by_handle(ent)
        end
    end
    PlayerProps = {}
    PlayerHasProp = false
end

local function playAnimation(animData)
    local inVehicle = PED.IS_PED_IN_ANY_VEHICLE(PLAYER.PLAYER_PED_ID(), true)
    local playerPed = PLAYER.PLAYER_PED_ID()
    CurrentAnimation = animData
    WEAPON.GIVE_WEAPON_TO_PED(PLAYER.PLAYER_PED_ID(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), 1, false, true)
    ChosenDict, ChosenAnimation = table.unpack(animData)
    -- if PlayerHasProp then clearProps(PlayerProps) end
    if ChosenDict == "MaleScenario" then 
        if playerIsMale() then
            TASK.CLEAR_PED_TASKS_IMMEDIATELY(playerPed)
            TASK.TASK_START_SCENARIO_IN_PLACE(playerPed, ChosenAnimation, 0, true)
            IsInAnimation = true
        else
            util.toast("This emote is only for male characters")
        end return
    elseif ChosenDict == "ScenarioObject" then 
        local BehindPlayer = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerPed, 0.0, 0 - 0.5, -0.5);
        local PlayerHeading = ENTITY.GET_ENTITY_HEADING(playerPed)
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(playerPed)
        TASK.TASK_START_SCENARIO_AT_POSITION(playerPed, ChosenAnimation, BehindPlayer['x'], BehindPlayer['y'], BehindPlayer['z'], PlayerHeading, 0, true, false)
        IsInAnimation = true
        return
    elseif ChosenDict == "Scenario" then 
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(playerPed)
        TASK.TASK_START_SCENARIO_IN_PLACE(playerPed, ChosenAnimation, 0, true)
        IsInAnimation = true
    return 
end

function streamPtfx(lib)
    STREAMING.REQUEST_NAMED_PTFX_ASSET(lib)
    while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(lib) do
        util.yield()
    end
    GRAPHICS.USE_PARTICLE_FX_ASSET(lib)
end

function ptfxStart(animData)
    PtfxAsset = animData.AnimationOptions.PtfxAsset
    PtfxName = animData.AnimationOptions.PtfxName
    if animData.AnimationOptions.PtfxNoProp then
        PtfxNoProp = animData.AnimationOptions.PtfxNoProp
    else
        PtfxNoProp = false
    end
    Ptfx1, Ptfx2, Ptfx3, Ptfx4, Ptfx5, Ptfx6, PtfxScale = table.unpack(animData.AnimationOptions.PtfxPlacement)
    PtfxBone = animData.AnimationOptions.PtfxBone and PED.GET_PED_BONE_INDEX(PLAYER.PLAYER_PED_ID(), animData.AnimationOptions.PtfxBone) or ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(PtfxName, "VFX")
    PtfxColor = animData.AnimationOptions.PtfxColor
    PtfxInfo = animData.AnimationOptions.PtfxInfo
    PtfxWait = animData.AnimationOptions.PtfxWait
    PtfxCanHold = animData.AnimationOptions.PtfxCanHold
    entityTarget = PLAYER.PLAYER_PED_ID()
    if not PtfxNoProp then
        entityTarget = PlayerProps[1]
    end
    streamPtfx(PtfxAsset)
    Ptfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE(PtfxName, entityTarget, Ptfx1, Ptfx2, Ptfx3, Ptfx4, Ptfx5, Ptfx6+180, PtfxBone, PtfxScale + 0.0, 0, 0, 0, 1065353216, 1065353216, 1065353216, 0)
    table.insert(PlayerParticles, Ptfx)
end

function ptfxStop()
    for i,v in pairs(PlayerParticles) do
        GRAPHICS.STOP_PARTICLE_FX_LOOPED(v, false)
        table.remove(PlayerParticles, i)
    end
end


    loadAnimation(ChosenDict)

    MovementType = 0 -- Default movement type

    if InVehicle == 1 then
        MovementType = 51
    elseif animData.AnimationOptions then
        if animData.AnimationOptions.EmoteMoving then
            MovementType = 51
        elseif animData.AnimationOptions.EmoteLoop then
            MovementType = 1
        elseif animData.AnimationOptions.EmoteStuck then
            MovementType = 50
        end
    end
  
      local AttachWait = 0
      if animData.AnimationOptions then
        if animData.AnimationOptions.EmoteDuration == nil then 
          animData.AnimationOptions.EmoteDuration = -1
          AttachWait = 0
        else
          AnimationDuration = animData.AnimationOptions.EmoteDuration
          AttachWait = animData.AnimationOptions.EmoteDuration
        end
      end

      TASK.TASK_PLAY_ANIM(playerPed, ChosenDict, ChosenAnimation, 2.0, 2.0, AnimationDuration, MovementType, 0, false, false, false)
      STREAMING.REMOVE_ANIM_DICT(ChosenDict)
      IsInAnimation = true

      if animData.AnimationOptions then
        if animData.AnimationOptions.Prop then
            PropName = animData.AnimationOptions.Prop
            PropBone = animData.AnimationOptions.PropBone
            PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(animData.AnimationOptions.PropPlacement)
            if animData.AnimationOptions.SecondProp then
              SecondPropName = animData.AnimationOptions.SecondProp
              SecondPropBone = animData.AnimationOptions.SecondPropBone
              SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6 = table.unpack(animData.AnimationOptions.SecondPropPlacement)
              SecondPropEmote = true
            else
              SecondPropEmote = false
            end
            util.yield(AttachWait)
            addProps(PropName, PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6, PlayerProps)
            if SecondPropEmote then
                addProps(SecondPropName, SecondPropBone, SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6, PlayerProps)
            end
        end
        --   ptfx
        if animData.AnimationOptions.PtfxAsset then
            PtfxPrompt = true
            notify('Press G to show effect')
        else
            PtfxPrompt = false
        end
      end



end

function stopAnimation()
    if IsInAnimation then
        if #PlayerParticles > 0 then ptfxStop() end
        TASK.CLEAR_PED_TASKS(PLAYER.PLAYER_PED_ID())
        TASK.CLEAR_PED_SECONDARY_TASK(PLAYER.PLAYER_PED_ID())
    end
    if PlayerHasProp then clearProps(PlayerProps) end
    IsInAnimation = false
    PtfxCanHold = false
    PtfxPrompt = false
end

function IsPlayerAiming(player)
    return PLAYER.IS_PLAYER_FREE_AIMING(player) or CAM.IS_AIM_CAM_ACTIVE() or CAM._IS_AIM_CAM_THIRD_PERSON_ACTIVE()
end

function spairs(t, order)
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end
--










-- menu --
menu.divider(menu.my_root(), SCRIPT_NAME)
OptEmote = menu.list(menu.my_root(), "Emote", {}, "", function(); end)
for k,v in spairs(Animation.Emotes, function(t, a, b) return t[a][3] < t[b][3] end) do
    local options <const> = {"play", "stop"}
    menu.slider_text(OptEmote, k, {"e"..k, k}, "", options, function(opt)
        if opt == 1 then
            playAnimation(v)
        else
            if v.forceStop then
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.PLAYER_PED_ID())
            else
                stopAnimation()
            end
        end
    end)
end

OptEmoteProp = menu.list(menu.my_root(), "Emote with prop", {}, "", function(); end)
for k,v in spairs(Animation.PropEmotes, function(t, a, b) return t[a][3] < t[b][3] end) do
    local options <const> = {"play", "stop"}
    menu.slider_text(OptEmoteProp, k, {"e"..k, k}, "", options, function(opt)
        if opt == 1 then
            playAnimation(v)
        else
            if v.forceStop then
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.PLAYER_PED_ID())
            else
                stopAnimation()
            end
        end
    end)
end

OptDances = menu.list(menu.my_root(), "Dances", {}, "", function(); end)
for k,v in spairs(Animation.Dances, function(t, a, b) return t[a][3] < t[b][3] end) do
    local options <const> = {"play", "stop"}
    menu.slider_text(OptDances, k, {"e"..k, k}, "", options, function(opt)
        if opt == 1 then
            playAnimation(v)
        else
            if v.forceStop then
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.PLAYER_PED_ID())
            else
                stopAnimation()
            end
        end
    end)
end

menu.action(menu.my_root(), "Random Dances", {"rdnc", "randomdances"}, "", function(on_click)
    local random = dance_list[math.random(1, #dance_list)]
    loadAnimation(random.dict)
    TASK.TASK_PLAY_ANIM(PLAYER.PLAYER_PED_ID(), random.dict, random.anim, 3.0, 3.0, -1, 1, 0, false, false, false)
    IsInAnimation = true
    STREAMING.REMOVE_ANIM_DICT(random.dict)
end)

-- menu.action(menu.my_root(), "Check", {}, "", function(on_click)
-- end)

OptMisc = menu.list(menu.my_root(), "Misc", {}, "", function(); end)
menu.action(OptMisc, "Stop Emote", {'estop'}, "", function(on_click)
    stopAnimation()
end)

menu.action(OptMisc, "Force Stop Emote", {'efstop'}, "", function(on_click)
    TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.PLAYER_PED_ID())
end)

local X_HandsUp = true
menu.toggle(OptMisc, "Hold X to Handsup", {}, "hold X to handsup, this will also stop running animation", function (on_change)
    if on_change then X_HandsUp = true else X_HandsUp = false end
end, X_HandsUp)

menu.toggle(OptMisc, "Crouch", {}, "", function (on_change)
    if on_change then
        STREAMING.REQUEST_ANIM_SET("move_ped_crouched")
        while not STREAMING.HAS_ANIM_SET_LOADED("move_ped_crouched") do 
            util.yield()
        end

        PED.SET_PED_USING_ACTION_MODE(PLAYER.PLAYER_PED_ID(), false, -1, "DEFAULT_ACTION")
        PED.SET_PED_MOVEMENT_CLIPSET(PLAYER.PLAYER_PED_ID(), "move_ped_crouched", 0.5)
        PED.SET_PED_STRAFE_CLIPSET(PLAYER.PLAYER_PED_ID(), "move_ped_crouched_strafing")
        isCrouched = true
    else
        PED.RESET_PED_MOVEMENT_CLIPSET(PLAYER.PLAYER_PED_ID(), 0.5)
        PED.RESET_PED_STRAFE_CLIPSET(PLAYER.PLAYER_PED_ID())
        STREAMING.REMOVE_ANIM_SET("move_ped_crouched")
        isCrouched = false
    end
end, isCrouched)

OptProp = menu.list(OptMisc, "Prop", {}, "", function(); end)
for k,v in spairs(prop_list, function(t, a, b) return t[b][3] end) do
    menu.toggle(OptProp, k, {"use" .. k}, "", function (on_change)
        if on_change then
            addProps(v.Prop, v.PropBone, v.PropPlacement[1], v.PropPlacement[2], v.PropPlacement[3], v.PropPlacement[4], v.PropPlacement[5], v.PropPlacement[6], v.Used)
            v.Use = true
        else 
            clearProps(v.Used)
            v.Use = false
        end
    end, v.Use)
    util.yield()
end

-- Manually check for updates with a menu option
menu.action(OptMisc, "Check for Update", {}, "The script will automatically check for updates at most daily, but you can manually check using this option anytime.", function()
    auto_update_config.check_interval = 0
    util.toast("Checking for updates")
    auto_updater.run_auto_update(auto_update_config)
end)











players.on_join(function(pid)
    if pid == players.user() then
        while memory.read_int(memory.script_global(1574988)) ~= 66 do util.yield() end
        for k,v in spairs(prop_list, function(t, a, b) return t[b][3] end) do
            if v.Use then
                addProps(v.Prop, v.PropBone, v.PropPlacement[1], v.PropPlacement[2], v.PropPlacement[3], v.PropPlacement[4], v.PropPlacement[5], v.PropPlacement[6], v.Used)
            end
        end
    end
end)

--loop

util.create_thread(function()
	while true do
		if PtfxPrompt then 
            if PAD.IS_CONTROL_PRESSED(0, 47) then
                ptfxStart(CurrentAnimation)
                util.yield(PtfxWait)
                if PtfxCanHold then
                    while PAD.IS_CONTROL_PRESSED(0, 47) and IsInAnimation do
                        util.yield(10)
                    end
                end
                ptfxStop()
            end
        end
		util.yield()
	end
end)

while true do
    if X_HandsUp then
        if PAD.IS_CONTROL_PRESSED(1, 323) then
            loadAnimation("random@mugging3")
            if not ENTITY.IS_ENTITY_PLAYING_ANIM(PLAYER.PLAYER_PED_ID(), "random@mugging3", "handsup_standing_base", 3) then
                stopAnimation()
                WEAPON.GIVE_WEAPON_TO_PED(PLAYER.PLAYER_PED_ID(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), 1, false, true)
                TASK.TASK_PLAY_ANIM(PLAYER.PLAYER_PED_ID(), "random@mugging3", "handsup_standing_base", 4, 4, -1, 51, 0, false, false, false)
                STREAMING.REMOVE_ANIM_DICT("random@mugging3")
                PED.SET_ENABLE_HANDCUFFS(PLAYER.PLAYER_PED_ID(), true)
                IsInAnimation = true
            end
        end
        if PAD.IS_CONTROL_RELEASED(1, 323) and ENTITY.IS_ENTITY_PLAYING_ANIM(PLAYER.PLAYER_PED_ID(), "random@mugging3", "handsup_standing_base", 3) then
            PED.SET_ENABLE_HANDCUFFS(PLAYER.PLAYER_PED_ID(), false)
            stopAnimation()
        end
    end

    -- crouch
    if isCrouched then
        if IsPlayerAiming(PLAYER.PLAYER_PED_ID()) then
            -- limiting movement when aiming
            PED.SET_PED_MAX_MOVE_BLEND_RATIO(PLAYER.PLAYER_PED_ID(), 0.2)
        end
        -- stay crouched 
        -- idk it doesn't work when characters punch :/
        PED.SET_PED_USING_ACTION_MODE(PLAYER.PLAYER_PED_ID(), false, -1, "DEFAULT_ACTION")
    end

    util.yield()
end
