
for i=1,7 do
  soundblock.register({
    filename = "horror_" .. i,
    key = "horror_" .. i,
    name = "Horror track " .. i
  })
end

soundblock.register({
  filename = "clock",
  key = "horror_clock",
  name = "Horror clock"
})

soundblock.register({
  filename = "clock_strikes_twelve",
  key = "clock_strikes_twelve",
  name = "Horror clock strikes twelve"
})

soundblock.register({
  filename = "Undersea_Garden",
  key = "Undersea_Garden",
  name = "Horror undersea garden"
})
