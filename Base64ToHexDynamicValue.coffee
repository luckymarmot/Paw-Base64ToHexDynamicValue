require "b64.js"

Base64ToHexDynamicValue = () ->

    @hexDigits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]

    @createHexString = (byteArray) ->
        result = ""

        for byte, idx in byteArray
            d1 = byte % 16
            d2 = (byte - d1) / 16
            result += "#{ @hexDigits[d2] }#{ @hexDigits[d1] }"

        return result

    @evaluate = () ->
        if @input
            byteArray = base64js.toByteArray @input
            return @createHexString byteArray

    @title = () ->
        "Base64 to Hex"

    @text = () ->
        return @input

    return


Base64ToHexDynamicValue.identifier = "com.luckymarmot.PawExtensions.Base64ToHexDynamicValue"
Base64ToHexDynamicValue.title = "Base64 to Hex Dynamic Value"
Base64ToHexDynamicValue.inputs = [
    DynamicValueInput "input", "Input", "String"
]
registerDynamicValueClass Base64ToHexDynamicValue