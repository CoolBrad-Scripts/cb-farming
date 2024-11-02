Config = {}
Config.ShowAllBlips = false -- Set this to false to show only one blip per zone
Config.Trees = {
    ["apple"] = {
        coords = {
            { label = "[E] Pick Apple", coords = vector3(1981.937, 4771.367, 41.901), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Apple", coords = vector3(2004.03, 4786.62, 41.81), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Apple", coords = vector3(2016.16, 4800.14, 42.04), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Apple", coords = vector3(2030.94, 4801.65, 41.89), length = 3, width = 3, height = 10, heading = 0}
        },
        anim = {
            dict = 'amb@prop_human_movie_studio_light@idle_a',
            clip = 'idle_a',
            flag = 0
        },
        blip = {
            sprite = 686,  -- You can change this to any blip sprite you want
            color = 2,   -- You can change this to any color you want
            scale = 0.5, -- You can adjust the scale of the blip
            label = "Apples", -- This will be the label on the map
        }
    },
    ["orange"] = {
        coords = {
            { label = "[E] Pick Orange", coords = vec3(2064.1, 4820.02, 41.83), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Orange", coords = vec3(2060.68, 4842.19, 41.88), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Orange", coords = vec3(2085.79, 4825.81, 41.6), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Orange", coords = vec3(2098.36, 4841.89, 41.66), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Orange", coords = vec3(2117.04, 4842.43, 41.59), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Orange", coords = vec3(2145.85, 4867.26, 40.69), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Orange", coords = vec3(2123.36, 4884.12, 40.88), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Orange", coords = vec3(2101.77, 4877.22, 41.08), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Orange", coords = vec3(2121.6, 4862.02, 41.09), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Orange", coords = vec3(2082.89, 4853.41, 41.88), length = 3, width = 3, height = 10, heading = 0}
        },
        anim = {
            dict = 'amb@prop_human_movie_studio_light@idle_a',
            clip = 'idle_a',
            flag = 0
        },
        blip = {
            sprite = 687,  -- You can change this to any blip sprite you want
            color = 2,   -- You can change this to any color you want
            scale = 0.5, -- You can adjust the scale of the blip
            label = "Oranges", -- This will be the label on the map
        }
    },
    ["lime"] = {
        coords = {
            { label = "[E] Pick Lime", coords = vec3(2336.02, 4975.37, 42.61), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Lime", coords = vec3(2349.08, 4976.24, 42.77), length = 3, width = 3, height = 10, heading = 0},
        },
        anim = {
            dict = 'amb@prop_human_movie_studio_light@idle_a',
            clip = 'idle_a',
            flag = 0
        },
        blip = {
            sprite = 688,  -- You can change this to any blip sprite you want
            color = 2,   -- You can change this to any color you want
            scale = 0.5, -- You can adjust the scale of the blip
            label = "Limes", -- This will be the label on the map
        }
    },
    ["lemon"] = {
        coords = {
            { label = "[E] Pick Lemon", coords = vec3(2349.88, 4989.75, 43.05), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Lemon", coords = vec3(2362.0, 4988.68, 43.35), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Lemon", coords = vec3(2361.76, 4976.92, 43.24), length = 3, width = 3, height = 10, heading = 0},
            
        },
        anim = {
            dict = 'amb@prop_human_movie_studio_light@idle_a',
            clip = 'idle_a',
            flag = 0
        },
        blip = {
            sprite = 689,  -- You can change this to any blip sprite you want
            color = 2,   -- You can change this to any color you want
            scale = 0.5, -- You can adjust the scale of the blip
            label = "Lemons", -- This will be the label on the map
        }
    },
    ["strawberry"] = {
        coords = {
            { label = "[E] Pick Strawberry", coords = vec3(1986.86, 4804.92, 42.73), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Strawberry", coords = vec3(1982.73, 4809.09, 43.0), length = 3, width = 3, height = 10, heading = 0},
        },
        anim = {
            dict = 'amb@prop_human_movie_studio_light@idle_a',
            clip = 'idle_a',
            flag = 0
        },
        blip = {
            sprite = 690,  -- You can change this to any blip sprite you want
            color = 2,   -- You can change this to any color you want
            scale = 0.5, -- You can adjust the scale of the blip
            label = "Strawberries", -- This will be the label on the map
        }
    },
    ["agave"] = {
        coords = {
            { label = "[E] Pick Agave", coords = vec3(2172.96, 4672.9, 35.39), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Agave", coords = vec3(2154.37, 4675.96, 36.07), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Agave", coords = vec3(2140.0, 4669.01, 35.24), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Agave", coords = vec3(2124.63, 4670.75, 35.49), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Agave", coords = vec3(2110.36, 4696.3, 40.87), length = 3, width = 3, height = 10, heading = 0}
            
        },
        anim = {
            dict = 'amb@prop_human_movie_studio_light@idle_a',
            clip = 'idle_a',
            flag = 0
        },
        blip = {
            sprite = 691,  -- You can change this to any blip sprite you want
            color = 2,   -- You can change this to any color you want
            scale = 0.5, -- You can adjust the scale of the blip
            label = "Agave", -- This will be the label on the map
        }
    },
    ["tomato"] = {
        coords = {
            { label = "[E] Pick Tomatoes", coords = vec3(2007.5, 4830.09, 42.88), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Tomatoes", coords = vec3(2003.34, 4834.34, 43.24), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Tomatoes", coords = vec3(1993.12, 4845.06, 43.97), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Tomatoes", coords = vec3(1988.98, 4849.24, 44.0), length = 3, width = 3, height = 10, heading = 0},
            
        },
        anim = {
            dict = 'amb@prop_human_movie_studio_light@idle_a',
            clip = 'idle_a',
            flag = 0
        },
        blip = {
            sprite = 692,  -- You can change this to any blip sprite you want
            color = 2,   -- You can change this to any color you want
            scale = 0.5, -- You can adjust the scale of the blip
            label = "Tomatoes", -- This will be the label on the map
        }
    },
    ["onion"] = {
        coords = {
            { label = "[E] Pick Onions", coords = vec3(1917.1, 4853.24, 47.17), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Onions", coords = vec3(1909.58, 4860.55, 47.14), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Onions", coords = vec3(1902.9, 4867.12, 46.95), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Onions", coords = vec3(1896.36, 4873.29, 46.57), length = 3, width = 3, height = 10, heading = 0},            
        },
        anim = {
            dict = 'anim@mp_snowball',
            clip = 'pickup_snowball',
            flag = 49
        },
        blip = {
            sprite = 693,  -- You can change this to any blip sprite you want
            color = 2,   -- You can change this to any color you want
            scale = 0.5, -- You can adjust the scale of the blip
            label = "Onions", -- This will be the label on the map
        }
    },
    ["potato"] = {
        coords = {
            { label = "[E] Pick Potatoes", coords = vec3(1925.24, 4858.0, 47.42), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Potatoes", coords = vec3(1917.88, 4864.97, 47.29), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Potatoes", coords = vec3(1910.65, 4872.24, 47.24), length = 3, width = 3, height = 10, heading = 0},
            { label = "[E] Pick Potatoes", coords = vec3(1900.1, 4882.64, 47.04), length = 3, width = 3, height = 10, heading = 0},            
        },
        anim = {
            dict = 'anim@mp_snowball',
            clip = 'pickup_snowball',
            flag = 49
        },
        blip = {
            sprite = 694,  -- You can change this to any blip sprite you want
            color = 2,   -- You can change this to any color you want
            scale = 0.5, -- You can adjust the scale of the blip
            label = "Potatoes", -- This will be the label on the map
        }
    },
}
Config.Cows = {
    SkillCheck = true,
    requiredItem = "testburger",
    milkDuration = 1000,
    milkItem = "testburger",
    spawnCows = {
        [1] = { coords = vec4(2217.06, 4900.35, 39.81, 316.06) },
        [2] = { coords = vec4(2213.18, 4905.08, 39.81, 320.51) },
        [3] = { coords = vec4(2215.02, 4902.96, 39.81, 316.79) },
        [4] = { coords = vec4(2219.44, 4897.81, 39.73, 319.36) },
        [5] = { coords = vec4(2211.0, 4907.35, 39.75, 316.85) }
    }
}