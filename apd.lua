-- Wait until the game services are fully initialized
while not game:IsLoaded() do
    wait(1)
end

-- Wait until ReplicatedStorage and Events are available
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local events = ReplicatedStorage:WaitForChild("Events")

-- Arguments for displaying and placing the unit
local displayArgs = {
    [1] = "DisplayUnit",
    [2] = "f4214830-7515-409a-b71f-02a22179d8cc"
}

local placeArgs = {
    [1] = "PlaceUnit",
    [2] = 104, -- Unit ID
    [3] = CFrame.new(-54.954322814941406, 9.469836235046387, -284.34637451171875) * CFrame.Angles(0, 0, 0),
    [4] = "104#2b8132a0-a1bf-4d19-8b2e-e3ddbc448202"
}

-- Function to display and place the unit
local function autoPlaceUnit()
    -- Ensure that the Event object is available before sending the request
    if events and events:FindFirstChild("Game") then
        -- Display the unit first
        events.Game:FireServer(unpack(displayArgs))
        
        -- Wait for 5 seconds before placing the unit
        wait(5)
        
        -- Place the unit after 5 seconds
        events.Game:FireServer(unpack(placeArgs))
    else
        print("Event 'Game' not found.")
    end
end

-- Start the unit placement process
autoPlaceUnit()
