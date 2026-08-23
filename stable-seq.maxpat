{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 5,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 34.0, 76.0, 1395.0, 756.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-161",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 734.0, 549.0, 95.0, 22.0 ],
                    "text": "prepend replace"
                }
            },
            {
                "box": {
                    "id": "obj-160",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 637.0, 549.0, 95.0, 22.0 ],
                    "text": "prepend replace"
                }
            },
            {
                "box": {
                    "id": "obj-159",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 540.0, 549.0, 95.0, 22.0 ],
                    "text": "prepend replace"
                }
            },
            {
                "box": {
                    "id": "obj-128",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 443.0, 549.0, 95.0, 22.0 ],
                    "text": "prepend replace"
                }
            },
            {
                "box": {
                    "id": "obj-126",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 443.0, 515.0, 76.0, 22.0 ],
                    "text": "route 0 1 2 3"
                }
            },
            {
                "box": {
                    "id": "obj-125",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 443.0, 479.0, 73.0, 22.0 ],
                    "text": "route /ready"
                }
            },
            {
                "box": {
                    "id": "obj-122",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 443.0, 447.0, 97.0, 22.0 ],
                    "text": "udpreceive 9001"
                }
            },
            {
                "box": {
                    "id": "obj-121",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 617.07, 475.61, 170.0, 22.0 ],
                    "text": "udpsend 192.168.114.52 9000"
                }
            },
            {
                "box": {
                    "id": "obj-109",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 676.8292844295502, 910.9756314754486, 220.0, 22.0 ],
                    "presentation_linecount": 2,
                    "text": "/load4 \"./Drum One Shots/HiHat02.wav\""
                }
            },
            {
                "box": {
                    "id": "obj-107",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 614.6341609954834, 859.7561180591583, 220.0, 22.0 ],
                    "presentation_linecount": 2,
                    "text": "/load3 \"./Drum One Shots/HiHat01.wav\""
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 414.6341562271118, 910.9756314754486, 222.0, 22.0 ],
                    "presentation_linecount": 2,
                    "text": "/load2 \"./Drum One Shots/Snare01.wav\""
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1123.170758485794, 1592.6829648017883, 63.0, 22.0 ],
                    "text": "s filepath4"
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1123.170758485794, 1560.9756469726562, 57.0, 22.0 ],
                    "text": "tosymbol"
                }
            },
            {
                "box": {
                    "id": "obj-103",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1123.170758485794, 1529.2683291435242, 77.0, 22.0 ],
                    "text": "absolutepath"
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 10,
                    "outlettype": [ "float", "list", "float", "float", "float", "float", "float", "", "int", "" ],
                    "patching_rect": [ 1123.170758485794, 1492.6829624176025, 113.5, 22.0 ],
                    "text": "info~ sample4"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1000.0000238418579, 1592.6829648017883, 63.0, 22.0 ],
                    "text": "s filepath3"
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1000.0000238418579, 1560.9756469726562, 57.0, 22.0 ],
                    "text": "tosymbol"
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1000.0000238418579, 1529.2683291435242, 77.0, 22.0 ],
                    "text": "absolutepath"
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 10,
                    "outlettype": [ "float", "list", "float", "float", "float", "float", "float", "", "int", "" ],
                    "patching_rect": [ 1000.0000238418579, 1492.6829624176025, 113.5, 22.0 ],
                    "text": "info~ sample3"
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 876.8292891979218, 1592.6829648017883, 63.0, 22.0 ],
                    "text": "s filepath2"
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 876.8292891979218, 1560.9756469726562, 57.0, 22.0 ],
                    "text": "tosymbol"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 876.8292891979218, 1529.2683291435242, 77.0, 22.0 ],
                    "text": "absolutepath"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 10,
                    "outlettype": [ "float", "list", "float", "float", "float", "float", "float", "", "int", "" ],
                    "patching_rect": [ 876.8292891979218, 1492.6829624176025, 113.5, 22.0 ],
                    "text": "info~ sample2"
                }
            },
            {
                "box": {
                    "id": "obj-235",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 183.442975461483, 1199.1009283065796, 37.0, 22.0 ],
                    "text": "* 300"
                }
            },
            {
                "box": {
                    "id": "obj-227",
                    "linecount": 15,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1112.1951484680176, 129.2682957649231, 50.0, 215.0 ],
                    "text": "/generate/3 \"bland closed hat\" C:/Users/navin/Documents/dev/stable-groove/output/out_022.wav 1."
                }
            },
            {
                "box": {
                    "id": "obj-228",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1003.6585605144501, -67.07317233085632, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-229",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1195.12197971344, 110.97561240196228, 117.0, 22.0 ],
                    "text": "prepend /generate/3"
                }
            },
            {
                "box": {
                    "id": "obj-230",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1118.2927095890045, 2.4390244483947754, 61.0, 22.0 ],
                    "text": "r filepath4"
                }
            },
            {
                "box": {
                    "id": "obj-231",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1101.219538450241, 57.31707453727722, 53.0, 22.0 ],
                    "text": "pak s s f"
                }
            },
            {
                "box": {
                    "id": "obj-232",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1041.463439464569, -29.268293380737305, 57.0, 22.0 ],
                    "text": "tosymbol"
                }
            },
            {
                "box": {
                    "id": "obj-233",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1201.2195408344269, -82.92683124542236, 41.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.dial[3]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "live.dial[3]"
                }
            },
            {
                "box": {
                    "format": 8,
                    "id": "obj-234",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1041.463439464569, -65.85366010665894, 155.22101879119873, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-219",
                    "linecount": 14,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 837.8048980236053, 141.46341800689697, 50.0, 202.0 ],
                    "text": "/generate/2 \"bland hi hat\" C:/Users/navin/Documents/dev/stable-groove/output/out_021.wav 1."
                }
            },
            {
                "box": {
                    "id": "obj-220",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 730.4878222942352, -54.878050088882446, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-221",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 920.7317292690277, 123.17073464393616, 117.0, 22.0 ],
                    "text": "prepend /generate/2"
                }
            },
            {
                "box": {
                    "id": "obj-222",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 843.9024591445923, 14.634146690368652, 61.0, 22.0 ],
                    "text": "r filepath3"
                }
            },
            {
                "box": {
                    "id": "obj-223",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 826.8292880058289, 69.5121967792511, 53.0, 22.0 ],
                    "text": "pak s s f"
                }
            },
            {
                "box": {
                    "id": "obj-224",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 767.0731890201569, -15.85365891456604, 57.0, 22.0 ],
                    "text": "tosymbol"
                }
            },
            {
                "box": {
                    "id": "obj-225",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 926.8292903900146, -70.73170900344849, 41.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.dial[2]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "live.dial[2]"
                }
            },
            {
                "box": {
                    "format": 8,
                    "id": "obj-226",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 767.0731890201569, -53.65853786468506, 155.22101879119873, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-211",
                    "linecount": 18,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 564.6341598033905, 156.09756469726562, 51.0, 257.0 ],
                    "text": "/generate/1 \"bland snare transient immediate\" C:/Users/navin/Documents/dev/stable-groove/output/out_028.wav 1."
                }
            },
            {
                "box": {
                    "id": "obj-212",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 456.097571849823, -41.46341562271118, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-213",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 647.5609910488129, 137.8048813343048, 117.0, 22.0 ],
                    "text": "prepend /generate/1"
                }
            },
            {
                "box": {
                    "id": "obj-214",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 570.7317209243774, 28.048781156539917, 61.0, 22.0 ],
                    "text": "r filepath2"
                }
            },
            {
                "box": {
                    "id": "obj-215",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 553.658549785614, 84.14634346961975, 53.0, 22.0 ],
                    "text": "pak s s f"
                }
            },
            {
                "box": {
                    "id": "obj-216",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 493.902450799942, -2.4390244483947754, 57.0, 22.0 ],
                    "text": "tosymbol"
                }
            },
            {
                "box": {
                    "id": "obj-217",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 653.6585521697998, -56.097562313079834, 41.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.dial[1]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "live.dial[1]"
                }
            },
            {
                "box": {
                    "format": 8,
                    "id": "obj-218",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 493.902450799942, -39.024391174316406, 155.22101879119873, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-209",
                    "linecount": 18,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 296.3414704799652, 145.12195467948914, 50.0, 257.0 ],
                    "text": "/generate/0 \"bland kick transient immediate\" C:/Users/navin/Documents/dev/stable-groove/output/out_026.wav 1."
                }
            },
            {
                "box": {
                    "id": "obj-206",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 155.942975461483, 1167.7631467580795, 82.0, 22.0 ],
                    "text": "route /Tempo/"
                }
            },
            {
                "box": {
                    "id": "obj-205",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 155.942975461483, 1138.4615676403046, 97.0, 22.0 ],
                    "text": "udpreceive 5712"
                }
            },
            {
                "box": {
                    "id": "obj-202",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 189.0243947505951, -52.43902564048767, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-192",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 379.2683017253876, 126.82927131652832, 117.0, 22.0 ],
                    "text": "prepend /generate/0"
                }
            },
            {
                "box": {
                    "id": "obj-189",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 302.43903160095215, 17.073171138763428, 61.0, 22.0 ],
                    "text": "r filepath1"
                }
            },
            {
                "box": {
                    "id": "obj-188",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 753.6585545539856, 1592.6829648017883, 63.0, 22.0 ],
                    "text": "s filepath1"
                }
            },
            {
                "box": {
                    "id": "obj-187",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 285.3658604621887, 73.17073345184326, 53.0, 22.0 ],
                    "text": "pak s s f"
                }
            },
            {
                "box": {
                    "id": "obj-186",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 753.6585545539856, 1560.9756469726562, 57.0, 22.0 ],
                    "text": "tosymbol"
                }
            },
            {
                "box": {
                    "id": "obj-182",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 753.6585545539856, 1529.2683291435242, 77.0, 22.0 ],
                    "text": "absolutepath"
                }
            },
            {
                "box": {
                    "id": "obj-181",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 10,
                    "outlettype": [ "float", "list", "float", "float", "float", "float", "float", "", "int", "" ],
                    "patching_rect": [ 753.6585545539856, 1492.6829624176025, 113.5, 22.0 ],
                    "text": "info~ sample1"
                }
            },
            {
                "box": {
                    "id": "obj-180",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 225.60976147651672, -13.414634466171265, 57.0, 22.0 ],
                    "text": "tosymbol"
                }
            },
            {
                "box": {
                    "id": "obj-177",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 237.49999570846558, 1463.9705603122711, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-178",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 237.49999570846558, 1497.0587949752808, 50.0, 22.0 ],
                    "text": "compile"
                }
            },
            {
                "box": {
                    "id": "obj-179",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 197.794114112854, 1497.0587949752808, 35.0, 22.0 ],
                    "text": "open"
                }
            },
            {
                "box": {
                    "id": "obj-176",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 233.82, 1552.21, 91.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "SendClock.js",
                        "parameter_enable": 0
                    },
                    "text": "js SendClock.js"
                }
            },
            {
                "box": {
                    "id": "obj-120",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 112.49999570846558, 1635.0, 183.0, 22.0 ],
                    "text": "udpsend 192.168.114.104 57110"
                }
            },
            {
                "box": {
                    "id": "obj-108",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 385.3658628463745, -65.85366010665894, 41.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.dial",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "live.dial"
                }
            },
            {
                "box": {
                    "format": 8,
                    "id": "obj-104",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 225.60976147651672, -50.000001192092896, 155.22101879119873, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-99",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 26.973683953285217, 1126.9736734628677, 97.0, 22.0 ],
                    "text": "udpreceive 5712"
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 26.973683953285217, 1167.7631467580795, 116.44736731052399, 22.0 ],
                    "text": "route /RUN/RUN/"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 319.2771165370941, 474.6988127231598, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 319.2771165370941, 507.2289344072342, 50.0, 22.0 ],
                    "text": "compile"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 279.5180789232254, 507.2289344072342, 35.0, 22.0 ],
                    "text": "open"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 279.5180789232254, 553.0120686292648, 121.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "ParseSequencer.js",
                        "parameter_enable": 0
                    },
                    "text": "js ParseSequencer.js"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 100.0, 553.0120686292648, 167.0, 22.0 ],
                    "text": "print TouchOscOut @popup 1"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 100.0, 507.2289344072342, 97.0, 22.0 ],
                    "text": "udpreceive 5712"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 379.33331298828125, 882.0, 213.0, 22.0 ],
                    "text": "/load1 \"./Drum One Shots/Kick02.wav\""
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 708.6857792139053, 1025.3852009773254, 95.0, 22.0 ],
                    "text": "prepend replace"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 600.6516251564026, 1025.4443006515503, 95.0, 22.0 ],
                    "text": "prepend replace"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 492.61747109889984, 1025.5034003257751, 95.0, 22.0 ],
                    "text": "prepend replace"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 384.5833170413971, 1025.5625, 95.0, 22.0 ],
                    "text": "prepend replace"
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 384.5833170413971, 971.8121228218079, 180.0, 22.0 ],
                    "text": "route /load1 /load2 /load3 /load4"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1432.3078289031982, 49.23077392578125, 67.0, 23.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-30",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1432.3078289031982, 73.84616088867188, 79.0, 23.0 ],
                    "text": "set sample1"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.501961, 0.717647, 0.764706, 1.0 ],
                    "buffername": "sample1",
                    "gridcolor": [ 0.352941, 0.337255, 0.521569, 1.0 ],
                    "id": "obj-31",
                    "maxclass": "waveform~",
                    "numinlets": 5,
                    "numoutlets": 6,
                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                    "patching_rect": [ 1432.3078289031982, 101.53847122192383, 330.0, 135.594055 ],
                    "selectioncolor": [ 0.313726, 0.498039, 0.807843, 0.0 ],
                    "setunit": 1,
                    "waveformcolor": [ 0.082353, 0.25098, 0.431373, 1.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1432.3078289031982, 261.5384864807129, 67.0, 23.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-27",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1432.3078289031982, 286.1538734436035, 79.0, 23.0 ],
                    "text": "set sample2"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.501961, 0.717647, 0.764706, 1.0 ],
                    "buffername": "sample2",
                    "gridcolor": [ 0.352941, 0.337255, 0.521569, 1.0 ],
                    "id": "obj-28",
                    "maxclass": "waveform~",
                    "numinlets": 5,
                    "numoutlets": 6,
                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                    "patching_rect": [ 1432.3078289031982, 313.84618377685547, 330.0, 135.594055 ],
                    "selectioncolor": [ 0.313726, 0.498039, 0.807843, 0.0 ],
                    "setunit": 1,
                    "waveformcolor": [ 0.082353, 0.25098, 0.431373, 1.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-23",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1432.3078289031982, 475.3846607208252, 67.0, 23.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-24",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1432.3078289031982, 500.0000476837158, 79.0, 23.0 ],
                    "text": "set sample3"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.501961, 0.717647, 0.764706, 1.0 ],
                    "buffername": "sample3",
                    "gridcolor": [ 0.352941, 0.337255, 0.521569, 1.0 ],
                    "id": "obj-25",
                    "maxclass": "waveform~",
                    "numinlets": 5,
                    "numoutlets": 6,
                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                    "patching_rect": [ 1432.3078289031982, 527.6923580169678, 330.0, 135.594055 ],
                    "selectioncolor": [ 0.313726, 0.498039, 0.807843, 0.0 ],
                    "setunit": 1,
                    "waveformcolor": [ 0.082353, 0.25098, 0.431373, 1.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1432.3078289031982, 690.7692966461182, 67.0, 23.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-21",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1432.3078289031982, 715.3846836090088, 79.0, 23.0 ],
                    "text": "set sample4"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.501961, 0.717647, 0.764706, 1.0 ],
                    "buffername": "sample4",
                    "gridcolor": [ 0.352941, 0.337255, 0.521569, 1.0 ],
                    "id": "obj-22",
                    "maxclass": "waveform~",
                    "numinlets": 5,
                    "numoutlets": 6,
                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                    "patching_rect": [ 1432.3078289031982, 743.0769939422607, 330.0, 135.594055 ],
                    "selectioncolor": [ 0.313726, 0.498039, 0.807843, 0.0 ],
                    "setunit": 1,
                    "waveformcolor": [ 0.082353, 0.25098, 0.431373, 1.0 ]
                }
            },
            {
                "box": {
                    "bgmode": 1,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-9",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vz.fadr.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1350.769359588623, 715.3846836090088, 72.30769920349121, 198.46155738830566 ],
                    "varname": "vz.twistr[3]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 1,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-8",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vz.fadr.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1350.769359588623, 500.0000476837158, 72.30769920349121, 198.46155738830566 ],
                    "varname": "vz.twistr[2]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 1,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-7",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vz.fadr.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1350.769359588623, 286.1538734436035, 72.30769920349121, 198.46155738830566 ],
                    "varname": "vz.twistr[1]",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 1,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-35",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "vz.fadr.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 1350.769359588623, 73.84616088867188, 72.30769920349121, 198.46155738830566 ],
                    "varname": "vz.twistr",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-77",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 94.99999570846558, 1321.0175912380219, 50.0, 20.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-75",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.416664361953735, 1216.8509285449982, 29.0, 18.0 ],
                    "text": "play"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-73",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 142.1875, 1076.5625, 59.5, 20.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "precision": 6
                    },
                    "text": "coll row3"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-72",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 128.125, 1051.5625, 59.5, 20.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "precision": 6
                    },
                    "text": "coll row2"
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 27.083332300186157, 1218.9342617988586, 20.0, 20.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-69",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 27.083332300186157, 1254.3509271144867, 56.0, 20.0 ],
                    "text": "metro 200"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-100",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 127.24999570846558, 1198.100929260254, 30.0, 18.0 ],
                    "text": "bpm"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "format": 6,
                    "id": "obj-101",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 122.91666197776794, 1223.1009283065796, 50.0, 20.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-102",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 122.91666197776794, 1252.2675938606262, 62.0, 20.0 ],
                    "text": "!/ 15000."
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 197.916659116745, 1404.3509213924408, 20.0, 20.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-68",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 197.916659116745, 1377.2675890922546, 32.5, 20.0 ],
                    "text": "sel 1"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 112.49999570846558, 1402.2675881385803, 20.0, 20.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-66",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 112.49999570846558, 1375.1842558383942, 32.5, 20.0 ],
                    "text": "sel 1"
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 27.083332300186157, 1396.017588376999, 20.0, 20.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-62",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 27.083332300186157, 1368.9342560768127, 32.5, 20.0 ],
                    "text": "sel 1"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "int", "int", "int", "int" ],
                    "patching_rect": [ 27.083332300186157, 1321.0175912380219, 52.0, 20.0 ],
                    "text": "t i i i i"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-60",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 197.916659116745, 1352.267590045929, 59.5, 20.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "precision": 6
                    },
                    "text": "coll row3"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-59",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 112.49999570846558, 1352.267590045929, 59.5, 20.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "precision": 6
                    },
                    "text": "coll row2"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-56",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "int", "", "", "int" ],
                    "patching_rect": [ 27.083332300186157, 1296.0175921916962, 61.0, 20.0 ],
                    "text": "counter 15"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-55",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 27.083332300186157, 1346.0175902843475, 59.5, 20.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "precision": 6
                    },
                    "text": "coll row1"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-52",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 114.0625, 1026.5625, 59.5, 20.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "precision": 6
                    },
                    "text": "coll row1"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-48",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "int" ],
                    "patching_rect": [ 100.0, 876.5625, 32.5, 20.0 ],
                    "text": "t b i"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-47",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 114.0625, 984.375, 46.0, 20.0 ],
                    "text": "gate 4"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-46",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 114.0625, 926.5625, 32.5, 20.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-39",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 142.1875, 923.4375, 35.0, 20.0 ],
                    "text": "zl reg"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 100.0, 856.25, 43.0, 20.0 ],
                    "text": "zl nth 2"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-78",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 362.4999861717224, 1098.1009330749512, 75.0, 18.0 ],
                    "text": "row 1 sample"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-79",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 362.4999861717224, 1116.8509323596954, 50.0, 20.0 ],
                    "text": "replace"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-80",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 427.0833170413971, 1116.8509323596954, 95.0, 20.0 ],
                    "text": "buffer~ sample1"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-81",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 362.4999861717224, 1148.1009311676025, 38.0, 20.0 ],
                    "text": "start"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-82",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 427.0833170413971, 1148.1009311676025, 85.0, 20.0 ],
                    "text": "play~ sample1"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-83",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 533.3333129882812, 1148.1009311676025, 48.0, 20.0 ],
                    "text": "*~ 0.7"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-84",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 362.4999861717224, 1198.100929260254, 75.0, 18.0 ],
                    "text": "row 2 sample"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-85",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 362.4999861717224, 1216.8509285449982, 50.0, 20.0 ],
                    "text": "replace"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-86",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 427.0833170413971, 1216.8509285449982, 95.0, 20.0 ],
                    "text": "buffer~ sample2"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-87",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 362.4999861717224, 1248.1009273529053, 38.0, 20.0 ],
                    "text": "start"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-88",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 427.0833170413971, 1248.1009273529053, 85.0, 20.0 ],
                    "text": "play~ sample2"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-89",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 533.3333129882812, 1248.1009273529053, 48.0, 20.0 ],
                    "text": "*~ 0.7"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-90",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 362.4999861717224, 1298.1009254455566, 75.0, 18.0 ],
                    "text": "row 3 sample"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-91",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 362.4999861717224, 1316.850924730301, 50.0, 20.0 ],
                    "text": "replace"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-92",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 427.0833170413971, 1316.850924730301, 95.0, 20.0 ],
                    "text": "buffer~ sample3"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-93",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 362.4999861717224, 1348.100923538208, 38.0, 20.0 ],
                    "text": "start"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-94",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 427.0833170413971, 1348.100923538208, 85.0, 20.0 ],
                    "text": "play~ sample3"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-95",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 533.3333129882812, 1348.100923538208, 48.0, 20.0 ],
                    "text": "*~ 0.7"
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 650.6516251564026, 1497.0587949752808, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-110",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 154.6875, 1101.5625, 59.5, 20.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "precision": 6
                    },
                    "text": "coll row4"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-111",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 283.3333225250244, 1352.267590045929, 59.5, 20.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "precision": 6
                    },
                    "text": "coll row4"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-112",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 283.3333225250244, 1377.2675890922546, 32.5, 20.0 ],
                    "text": "sel 1"
                }
            },
            {
                "box": {
                    "id": "obj-113",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 283.3333225250244, 1404.3509213924408, 20.0, 20.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-114",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 362.4999861717224, 1404.3509213924408, 75.0, 18.0 ],
                    "text": "row 4 sample"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-115",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 362.4999861717224, 1425.1842539310455, 50.0, 20.0 ],
                    "text": "replace"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-116",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 427.0833170413971, 1425.1842539310455, 95.0, 20.0 ],
                    "text": "buffer~ sample4"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-117",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 362.4999861717224, 1454.3509194850922, 38.0, 20.0 ],
                    "text": "start"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-118",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 427.0833170413971, 1454.3509194850922, 85.0, 20.0 ],
                    "text": "play~ sample4"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 10.0,
                    "id": "obj-119",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 533.3333129882812, 1454.3509194850922, 48.0, 20.0 ],
                    "text": "*~ 0.7"
                }
            },
            {
                "box": {
                    "columns": 16,
                    "id": "obj-20",
                    "maxclass": "matrixctrl",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "list", "list" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 100.0, 626.5625, 801.5625, 200.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "source": [ "obj-101", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-69", 1 ],
                    "source": [ "obj-102", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-98", 0 ],
                    "source": [ "obj-103", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-180", 0 ],
                    "source": [ "obj-104", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 0 ],
                    "source": [ "obj-105", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "source": [ "obj-106", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "source": [ "obj-107", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-187", 2 ],
                    "source": [ "obj-108", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "source": [ "obj-109", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-112", 0 ],
                    "source": [ "obj-111", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-113", 0 ],
                    "source": [ "obj-112", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-117", 0 ],
                    "source": [ "obj-113", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-116", 0 ],
                    "source": [ "obj-115", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-105", 0 ],
                    "source": [ "obj-116", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-118", 0 ],
                    "source": [ "obj-117", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-119", 0 ],
                    "source": [ "obj-118", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 1 ],
                    "order": 0,
                    "source": [ "obj-119", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "order": 1,
                    "source": [ "obj-119", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-125", 0 ],
                    "source": [ "obj-122", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-126", 0 ],
                    "source": [ "obj-125", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-128", 0 ],
                    "source": [ "obj-126", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-159", 0 ],
                    "source": [ "obj-126", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-160", 0 ],
                    "source": [ "obj-126", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-161", 0 ],
                    "source": [ "obj-126", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "source": [ "obj-128", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "source": [ "obj-159", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-92", 0 ],
                    "source": [ "obj-160", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-116", 0 ],
                    "source": [ "obj-161", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-120", 0 ],
                    "source": [ "obj-176", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-178", 0 ],
                    "source": [ "obj-177", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-176", 0 ],
                    "source": [ "obj-178", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-176", 0 ],
                    "source": [ "obj-179", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-187", 0 ],
                    "source": [ "obj-180", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-182", 0 ],
                    "source": [ "obj-181", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-186", 0 ],
                    "source": [ "obj-182", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-188", 0 ],
                    "source": [ "obj-186", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-192", 0 ],
                    "source": [ "obj-187", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-187", 1 ],
                    "source": [ "obj-189", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-209", 1 ],
                    "source": [ "obj-192", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-209", 0 ],
                    "source": [ "obj-202", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-206", 0 ],
                    "source": [ "obj-205", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-235", 0 ],
                    "source": [ "obj-206", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-121", 0 ],
                    "source": [ "obj-209", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-121", 0 ],
                    "source": [ "obj-211", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-211", 0 ],
                    "source": [ "obj-212", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-211", 1 ],
                    "source": [ "obj-213", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-215", 1 ],
                    "source": [ "obj-214", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-213", 0 ],
                    "source": [ "obj-215", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-215", 0 ],
                    "source": [ "obj-216", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-215", 2 ],
                    "source": [ "obj-217", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-216", 0 ],
                    "source": [ "obj-218", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-121", 0 ],
                    "source": [ "obj-219", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-219", 0 ],
                    "source": [ "obj-220", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-219", 1 ],
                    "source": [ "obj-221", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-223", 1 ],
                    "source": [ "obj-222", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-221", 0 ],
                    "source": [ "obj-223", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-223", 0 ],
                    "source": [ "obj-224", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-223", 2 ],
                    "source": [ "obj-225", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-224", 0 ],
                    "source": [ "obj-226", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-121", 0 ],
                    "source": [ "obj-227", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-227", 0 ],
                    "source": [ "obj-228", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-227", 1 ],
                    "source": [ "obj-229", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-231", 1 ],
                    "source": [ "obj-230", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-229", 0 ],
                    "source": [ "obj-231", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-231", 0 ],
                    "source": [ "obj-232", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-231", 2 ],
                    "source": [ "obj-233", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-232", 0 ],
                    "source": [ "obj-234", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-101", 0 ],
                    "source": [ "obj-235", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-83", 1 ],
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 1 ],
                    "midpoints": [ 133.5, 873.5625, 167.6875, 873.5625 ],
                    "source": [ "obj-38", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 1 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "order": 0,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "order": 1,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-40", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "source": [ "obj-40", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "source": [ "obj-40", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-92", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-116", 0 ],
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-110", 0 ],
                    "source": [ "obj-47", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 0 ],
                    "source": [ "obj-47", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "source": [ "obj-47", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 0 ],
                    "midpoints": [ 109.5, 908.5625, 151.6875, 908.5625 ],
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-48", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "source": [ "obj-54", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "order": 1,
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "order": 0,
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-111", 0 ],
                    "source": [ "obj-61", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "source": [ "obj-61", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-61", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-81", 0 ],
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-87", 0 ],
                    "source": [ "obj-65", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "source": [ "obj-66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "source": [ "obj-68", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "source": [ "obj-69", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 1 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-69", 0 ],
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "source": [ "obj-74", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "source": [ "obj-76", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-176", 0 ],
                    "source": [ "obj-77", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "source": [ "obj-79", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 1 ],
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-181", 0 ],
                    "source": [ "obj-80", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-82", 0 ],
                    "source": [ "obj-81", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-83", 0 ],
                    "source": [ "obj-82", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 1 ],
                    "order": 0,
                    "source": [ "obj-83", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "order": 1,
                    "source": [ "obj-83", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "source": [ "obj-85", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "source": [ "obj-86", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-88", 0 ],
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "source": [ "obj-88", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 1 ],
                    "order": 0,
                    "source": [ "obj-89", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "order": 1,
                    "source": [ "obj-89", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-119", 1 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-92", 0 ],
                    "source": [ "obj-91", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 0 ],
                    "source": [ "obj-92", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-94", 0 ],
                    "source": [ "obj-93", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 0 ],
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 1 ],
                    "order": 0,
                    "source": [ "obj-95", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "order": 1,
                    "source": [ "obj-95", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-97", 0 ],
                    "source": [ "obj-98", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-99", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-108": [ "live.dial", "live.dial", 0 ],
            "obj-217": [ "live.dial[1]", "live.dial", 0 ],
            "obj-225": [ "live.dial[2]", "live.dial", 0 ],
            "obj-233": [ "live.dial[3]", "live.dial", 0 ],
            "obj-35::obj-11": [ "pictctrl[2]", "pictctrl[1]", 0 ],
            "obj-35::obj-16": [ "pictctrl[7]", "pictctrl[1]", 0 ],
            "obj-35::obj-51": [ "pictctrl[3]", "pictctrl[1]", 0 ],
            "obj-35::obj-9": [ "Fader[1]", "Fader", 0 ],
            "obj-7::obj-11": [ "pictctrl[14]", "pictctrl[1]", 0 ],
            "obj-7::obj-16": [ "pictctrl[15]", "pictctrl[1]", 0 ],
            "obj-7::obj-51": [ "pictctrl[11]", "pictctrl[1]", 0 ],
            "obj-7::obj-9": [ "Fader[3]", "Fader", 0 ],
            "obj-8::obj-11": [ "pictctrl[12]", "pictctrl[1]", 0 ],
            "obj-8::obj-16": [ "pictctrl[17]", "pictctrl[1]", 0 ],
            "obj-8::obj-51": [ "pictctrl[16]", "pictctrl[1]", 0 ],
            "obj-8::obj-9": [ "Fader[4]", "Fader", 0 ],
            "obj-9::obj-11": [ "pictctrl[13]", "pictctrl[1]", 0 ],
            "obj-9::obj-16": [ "pictctrl[18]", "pictctrl[1]", 0 ],
            "obj-9::obj-51": [ "pictctrl[19]", "pictctrl[1]", 0 ],
            "obj-9::obj-9": [ "Fader[5]", "Fader", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "parameter_overrides": {
                "obj-35::obj-16": {
                    "parameter_longname": "pictctrl[7]"
                },
                "obj-35::obj-51": {
                    "parameter_longname": "pictctrl[3]"
                },
                "obj-35::obj-9": {
                    "parameter_longname": "Fader[1]"
                },
                "obj-7::obj-16": {
                    "parameter_longname": "pictctrl[15]"
                },
                "obj-7::obj-51": {
                    "parameter_longname": "pictctrl[11]"
                },
                "obj-7::obj-9": {
                    "parameter_longname": "Fader[3]"
                },
                "obj-8::obj-16": {
                    "parameter_longname": "pictctrl[17]"
                },
                "obj-8::obj-51": {
                    "parameter_longname": "pictctrl[16]"
                },
                "obj-8::obj-9": {
                    "parameter_longname": "Fader[4]"
                },
                "obj-9::obj-16": {
                    "parameter_longname": "pictctrl[18]"
                },
                "obj-9::obj-51": {
                    "parameter_longname": "pictctrl[19]"
                },
                "obj-9::obj-9": {
                    "parameter_longname": "Fader[5]"
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}