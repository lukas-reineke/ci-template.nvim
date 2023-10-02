assert = require "luassert"

describe("example", function()
    it("can run tests", function()
        assert.are.same("hello", "hello")
    end)
end)
