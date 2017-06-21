/**
 * 作者：卢斌晖
 * 2014-04-21
 */
package com.picc.common.utils.gson;

import java.lang.reflect.Type;
import java.util.Date;

import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.picc.common.utils.DateTimeUtil;

public class DateSerializer implements JsonSerializer<Date> 
{
	public JsonElement serialize(Date src, Type typeOfSrc, JsonSerializationContext context)
	{
	    return new JsonPrimitive(DateTimeUtil.formatDateTime(src));
	}
}