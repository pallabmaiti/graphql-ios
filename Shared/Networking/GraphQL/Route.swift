// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LaunchListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query LaunchList {
      launchesPast(limit: 20) {
        __typename
        ...LaunchFragment
      }
    }
    """

  public let operationName: String = "LaunchList"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + LaunchFragment.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("launchesPast", arguments: ["limit": 20], type: .list(.object(LaunchesPast.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launchesPast: [LaunchesPast?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "launchesPast": launchesPast.flatMap { (value: [LaunchesPast?]) -> [ResultMap?] in value.map { (value: LaunchesPast?) -> ResultMap? in value.flatMap { (value: LaunchesPast) -> ResultMap in value.resultMap } } }])
    }

    public var launchesPast: [LaunchesPast?]? {
      get {
        return (resultMap["launchesPast"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [LaunchesPast?] in value.map { (value: ResultMap?) -> LaunchesPast? in value.flatMap { (value: ResultMap) -> LaunchesPast in LaunchesPast(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [LaunchesPast?]) -> [ResultMap?] in value.map { (value: LaunchesPast?) -> ResultMap? in value.flatMap { (value: LaunchesPast) -> ResultMap in value.resultMap } } }, forKey: "launchesPast")
      }
    }

    public struct LaunchesPast: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Launch"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(LaunchFragment.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var launchFragment: LaunchFragment {
          get {
            return LaunchFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct LaunchFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment LaunchFragment on Launch {
      __typename
      id
      mission_name
      launch_date_local
      launch_site {
        __typename
        site_name_long
      }
    }
    """

  public static let possibleTypes: [String] = ["Launch"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .scalar(GraphQLID.self)),
      GraphQLField("mission_name", type: .scalar(String.self)),
      GraphQLField("launch_date_local", type: .scalar(String.self)),
      GraphQLField("launch_site", type: .object(LaunchSite.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID? = nil, missionName: String? = nil, launchDateLocal: String? = nil, launchSite: LaunchSite? = nil) {
    self.init(unsafeResultMap: ["__typename": "Launch", "id": id, "mission_name": missionName, "launch_date_local": launchDateLocal, "launch_site": launchSite.flatMap { (value: LaunchSite) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID? {
    get {
      return resultMap["id"] as? GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var missionName: String? {
    get {
      return resultMap["mission_name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "mission_name")
    }
  }

  public var launchDateLocal: String? {
    get {
      return resultMap["launch_date_local"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "launch_date_local")
    }
  }

  public var launchSite: LaunchSite? {
    get {
      return (resultMap["launch_site"] as? ResultMap).flatMap { LaunchSite(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "launch_site")
    }
  }

  public struct LaunchSite: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["LaunchSite"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("site_name_long", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(siteNameLong: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "LaunchSite", "site_name_long": siteNameLong])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var siteNameLong: String? {
      get {
        return resultMap["site_name_long"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "site_name_long")
      }
    }
  }
}
