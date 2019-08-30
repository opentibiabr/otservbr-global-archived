-- Copyright (c) 2013 Skyen Hasus
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.

module("matrix", package.seeall)

_G.DEGREES_0 = 0
_G.DEGREES_90 = 90
_G.DEGREES_180 = 180
_G.DEGREES_270 = 270

_G.DIRECTION_VERTICAL = 0
_G.DIRECTION_HORIZONTAL = 1

local function rotate_90(matrix)
        local ret = {}

        for y in ipairs(matrix) do
                local w = #matrix[y]

                for x, v in ipairs(matrix[y]) do
                        if not ret[w-x+1] then
                                ret[w-x+1] = {}
                        end

                        ret[w-x+1][y] = v
                end
        end

        return ret
end

local function rotate_180(matrix)
        local ret = {}
        local h = #matrix

        for y in ipairs(matrix) do
                local w = #matrix[y]

                for x, v in ipairs(matrix[y]) do
                        if not ret[h-y+1] then
                                ret[h-y+1] = {}
                        end

                        ret[h-y+1][w-x+1] = v
                end
        end

        return ret
end

local function rotate_270(matrix)
        local ret = {}
        local h = #matrix

        for y in ipairs(matrix) do
                for x, v in ipairs(matrix[y]) do
                        if not ret[x] then
                                ret[x] = {}
                        end

                        ret[x][h-y+1] = v
                end
        end

        return ret
end

local function mirror_v(matrix)
        local ret = {}
        local h = #matrix

        for y in ipairs(matrix) do
                for x, v in ipairs(matrix[y]) do
                        if not ret[h-y+1] then
                                ret[h-y+1] = {}
                        end

                        ret[h-y+1][x] = v
                end
        end

        return ret
end

local function mirror_h(matrix)
        local ret = {}

        for y in ipairs(matrix) do
                local w = #matrix[y]

                for x, v in ipairs(matrix[y]) do
                        if not ret[y] then
                                ret[y] = {}
                        end

                        ret[y][w-x+1] = v
                end
        end

        return ret
end

function rotate(matrix, degrees)
        degrees = degrees % 360

        if degrees == DEGREES_0 then
                return matrix
        elseif degrees == DEGREES_90 then
                return rotate_90(matrix)
        elseif degrees == DEGREES_180 then
                return rotate_180(matrix)
        elseif degrees == DEGREES_270 then
                return rotate_270(matrix)
        end

        error("Invalid degree value to function 'rotate'.", 2)
        return false
end

function mirror(matrix, direction)
        if direction == DIRECTION_VERTICAL then
                return mirror_v(matrix)
        elseif direction == DIRECTION_HORIZONTAL then
                return mirror_h(matrix)
        end

        error("Invalid direction to function 'mirror'.", 2)
        return false
end

print("> Addons ==> Matrix - loaded successfully!")