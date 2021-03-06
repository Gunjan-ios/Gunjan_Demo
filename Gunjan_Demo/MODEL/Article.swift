//
//  Article.swift
//  Created on September 27, 2021

import Foundation
import SwiftyJSON


class Article : NSObject, NSCoding{

    var author : String!
    var content : String!
    var descriptionField : String!
    var publishedAt : String!
    var source : Source!
    var title : String!
    var url : String!
    var urlToImage : String!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        author = json["author"].stringValue
        content = json["content"].stringValue
        descriptionField = json["description"].stringValue
        publishedAt = json["publishedAt"].stringValue
        let sourceJson = json["source"]
        if !sourceJson.isEmpty{
            source = Source(fromJson: sourceJson)
        }
        title = json["title"].stringValue
        url = json["url"].stringValue
        urlToImage = json["urlToImage"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if author != nil{
        	dictionary["author"] = author
        }
        if content != nil{
        	dictionary["content"] = content
        }
        if descriptionField != nil{
        	dictionary["description"] = descriptionField
        }
        if publishedAt != nil{
        	dictionary["publishedAt"] = publishedAt
        }
        if source != nil{
        	dictionary["source"] = source.toDictionary()
        }
        if title != nil{
        	dictionary["title"] = title
        }
        if url != nil{
        	dictionary["url"] = url
        }
        if urlToImage != nil{
        	dictionary["urlToImage"] = urlToImage
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		author = aDecoder.decodeObject(forKey: "author") as? String
		content = aDecoder.decodeObject(forKey: "content") as? String
		descriptionField = aDecoder.decodeObject(forKey: "description") as? String
		publishedAt = aDecoder.decodeObject(forKey: "publishedAt") as? String
		source = aDecoder.decodeObject(forKey: "source") as? Source
		title = aDecoder.decodeObject(forKey: "title") as? String
		url = aDecoder.decodeObject(forKey: "url") as? String
		urlToImage = aDecoder.decodeObject(forKey: "urlToImage") as? String
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if author != nil{
			aCoder.encode(author, forKey: "author")
		}
		if content != nil{
			aCoder.encode(content, forKey: "content")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if publishedAt != nil{
			aCoder.encode(publishedAt, forKey: "publishedAt")
		}
		if source != nil{
			aCoder.encode(source, forKey: "source")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}
		if urlToImage != nil{
			aCoder.encode(urlToImage, forKey: "urlToImage")
		}

	}

}
