// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct sessionSubjectInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - name
  ///   - length
  public init(name: Swift.Optional<String?> = nil, length: Swift.Optional<Int?> = nil) {
    graphQLMap = ["name": name, "length": length]
  }

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var length: Swift.Optional<Int?> {
    get {
      return graphQLMap["length"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "length")
    }
  }
}

public struct subjectNotesInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - subjectId
  ///   - notes
  public init(subjectId: Swift.Optional<String?> = nil, notes: Swift.Optional<String?> = nil) {
    graphQLMap = ["subjectID": subjectId, "notes": notes]
  }

  public var subjectId: Swift.Optional<String?> {
    get {
      return graphQLMap["subjectID"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subjectID")
    }
  }

  public var notes: Swift.Optional<String?> {
    get {
      return graphQLMap["notes"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notes")
    }
  }
}

public struct goalInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - description
  ///   - subject
  ///   - targetTime
  ///   - deadline
  public init(description: String, subject: String, targetTime: Int, deadline: Swift.Optional<String?> = nil) {
    graphQLMap = ["description": description, "subject": subject, "targetTime": targetTime, "deadline": deadline]
  }

  public var description: String {
    get {
      return graphQLMap["description"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var subject: String {
    get {
      return graphQLMap["subject"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subject")
    }
  }

  public var targetTime: Int {
    get {
      return graphQLMap["targetTime"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "targetTime")
    }
  }

  public var deadline: Swift.Optional<String?> {
    get {
      return graphQLMap["deadline"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "deadline")
    }
  }
}

public struct SubjectLinkInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - url
  ///   - description
  public init(url: Swift.Optional<String?> = nil, description: Swift.Optional<String?> = nil) {
    graphQLMap = ["url": url, "description": description]
  }

  public var url: Swift.Optional<String?> {
    get {
      return graphQLMap["url"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "url")
    }
  }

  public var description: Swift.Optional<String?> {
    get {
      return graphQLMap["description"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }
}

public final class AddSessionMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation addSession($totalLength: Int!, $individualSubjects: [sessionSubjectInput!]!, $notes: String, $userID: String!) {
      addSession(
        userID: $userID
        totalLength: $totalLength
        notes: $notes
        individualSubjects: $individualSubjects
      ) {
        __typename
        ...SessionItems
      }
    }
    """

  public let operationName: String = "addSession"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + SessionItems.fragmentDefinition)
    return document
  }

  public var totalLength: Int
  public var individualSubjects: [sessionSubjectInput]
  public var notes: String?
  public var userID: String

  public init(totalLength: Int, individualSubjects: [sessionSubjectInput], notes: String? = nil, userID: String) {
    self.totalLength = totalLength
    self.individualSubjects = individualSubjects
    self.notes = notes
    self.userID = userID
  }

  public var variables: GraphQLMap? {
    return ["totalLength": totalLength, "individualSubjects": individualSubjects, "notes": notes, "userID": userID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addSession", arguments: ["userID": GraphQLVariable("userID"), "totalLength": GraphQLVariable("totalLength"), "notes": GraphQLVariable("notes"), "individualSubjects": GraphQLVariable("individualSubjects")], type: .object(AddSession.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addSession: AddSession? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addSession": addSession.flatMap { (value: AddSession) -> ResultMap in value.resultMap }])
    }

    public var addSession: AddSession? {
      get {
        return (resultMap["addSession"] as? ResultMap).flatMap { AddSession(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addSession")
      }
    }

    public struct AddSession: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Session"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(SessionItems.self),
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

        public var sessionItems: SessionItems {
          get {
            return SessionItems(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class EditUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation editUser($id: String!, $subjectNotes: subjectNotesInput!) {
      editUser(id: $id, subjectNotes: $subjectNotes) {
        __typename
        ...UserItems
      }
    }
    """

  public let operationName: String = "editUser"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + UserItems.fragmentDefinition)
    document.append("\n" + SessionItems.fragmentDefinition)
    return document
  }

  public var id: String
  public var subjectNotes: subjectNotesInput

  public init(id: String, subjectNotes: subjectNotesInput) {
    self.id = id
    self.subjectNotes = subjectNotes
  }

  public var variables: GraphQLMap? {
    return ["id": id, "subjectNotes": subjectNotes]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("editUser", arguments: ["id": GraphQLVariable("id"), "subjectNotes": GraphQLVariable("subjectNotes")], type: .object(EditUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(editUser: EditUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "editUser": editUser.flatMap { (value: EditUser) -> ResultMap in value.resultMap }])
    }

    public var editUser: EditUser? {
      get {
        return (resultMap["editUser"] as? ResultMap).flatMap { EditUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "editUser")
      }
    }

    public struct EditUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(UserItems.self),
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

        public var userItems: UserItems {
          get {
            return UserItems(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class AddGoalMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation addGoal($id: String!, $goal: goalInput!) {
      addGoal(id: $id, goal: $goal) {
        __typename
        ...UserItems
      }
    }
    """

  public let operationName: String = "addGoal"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + UserItems.fragmentDefinition)
    document.append("\n" + SessionItems.fragmentDefinition)
    return document
  }

  public var id: String
  public var goal: goalInput

  public init(id: String, goal: goalInput) {
    self.id = id
    self.goal = goal
  }

  public var variables: GraphQLMap? {
    return ["id": id, "goal": goal]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addGoal", arguments: ["id": GraphQLVariable("id"), "goal": GraphQLVariable("goal")], type: .object(AddGoal.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addGoal: AddGoal? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addGoal": addGoal.flatMap { (value: AddGoal) -> ResultMap in value.resultMap }])
    }

    public var addGoal: AddGoal? {
      get {
        return (resultMap["addGoal"] as? ResultMap).flatMap { AddGoal(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addGoal")
      }
    }

    public struct AddGoal: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(UserItems.self),
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

        public var userItems: UserItems {
          get {
            return UserItems(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class DeleteSessionMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation deleteSession($id: String!) {
      deleteSession(id: $id) {
        __typename
        ...SessionItems
      }
    }
    """

  public let operationName: String = "deleteSession"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + SessionItems.fragmentDefinition)
    return document
  }

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteSession", arguments: ["id": GraphQLVariable("id")], type: .object(DeleteSession.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteSession: DeleteSession? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteSession": deleteSession.flatMap { (value: DeleteSession) -> ResultMap in value.resultMap }])
    }

    public var deleteSession: DeleteSession? {
      get {
        return (resultMap["deleteSession"] as? ResultMap).flatMap { DeleteSession(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteSession")
      }
    }

    public struct DeleteSession: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Session"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(SessionItems.self),
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

        public var sessionItems: SessionItems {
          get {
            return SessionItems(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class EditGoalMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation editGoal($userID: String!, $goalID: String!, $time: Int!) {
      editGoal(userID: $userID, goalID: $goalID, time: $time) {
        __typename
        id
        description
        subject
        targetTime
        elapsedTime
        deadline
        passed
      }
    }
    """

  public let operationName: String = "editGoal"

  public var userID: String
  public var goalID: String
  public var time: Int

  public init(userID: String, goalID: String, time: Int) {
    self.userID = userID
    self.goalID = goalID
    self.time = time
  }

  public var variables: GraphQLMap? {
    return ["userID": userID, "goalID": goalID, "time": time]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("editGoal", arguments: ["userID": GraphQLVariable("userID"), "goalID": GraphQLVariable("goalID"), "time": GraphQLVariable("time")], type: .object(EditGoal.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(editGoal: EditGoal? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "editGoal": editGoal.flatMap { (value: EditGoal) -> ResultMap in value.resultMap }])
    }

    public var editGoal: EditGoal? {
      get {
        return (resultMap["editGoal"] as? ResultMap).flatMap { EditGoal(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "editGoal")
      }
    }

    public struct EditGoal: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Goal"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("subject", type: .nonNull(.scalar(String.self))),
          GraphQLField("targetTime", type: .nonNull(.scalar(Int.self))),
          GraphQLField("elapsedTime", type: .nonNull(.scalar(Int.self))),
          GraphQLField("deadline", type: .scalar(String.self)),
          GraphQLField("passed", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, description: String, subject: String, targetTime: Int, elapsedTime: Int, deadline: String? = nil, passed: Bool) {
        self.init(unsafeResultMap: ["__typename": "Goal", "id": id, "description": description, "subject": subject, "targetTime": targetTime, "elapsedTime": elapsedTime, "deadline": deadline, "passed": passed])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var subject: String {
        get {
          return resultMap["subject"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subject")
        }
      }

      public var targetTime: Int {
        get {
          return resultMap["targetTime"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "targetTime")
        }
      }

      public var elapsedTime: Int {
        get {
          return resultMap["elapsedTime"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "elapsedTime")
        }
      }

      public var deadline: String? {
        get {
          return resultMap["deadline"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "deadline")
        }
      }

      public var passed: Bool {
        get {
          return resultMap["passed"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "passed")
        }
      }
    }
  }
}

public final class DeleteGoalMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation deleteGoal($userID: String!, $goalID: String!) {
      deleteGoal(userID: $userID, goalID: $goalID) {
        __typename
        ...UserItems
      }
    }
    """

  public let operationName: String = "deleteGoal"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + UserItems.fragmentDefinition)
    document.append("\n" + SessionItems.fragmentDefinition)
    return document
  }

  public var userID: String
  public var goalID: String

  public init(userID: String, goalID: String) {
    self.userID = userID
    self.goalID = goalID
  }

  public var variables: GraphQLMap? {
    return ["userID": userID, "goalID": goalID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteGoal", arguments: ["userID": GraphQLVariable("userID"), "goalID": GraphQLVariable("goalID")], type: .object(DeleteGoal.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteGoal: DeleteGoal? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteGoal": deleteGoal.flatMap { (value: DeleteGoal) -> ResultMap in value.resultMap }])
    }

    public var deleteGoal: DeleteGoal? {
      get {
        return (resultMap["deleteGoal"] as? ResultMap).flatMap { DeleteGoal(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteGoal")
      }
    }

    public struct DeleteGoal: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(UserItems.self),
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

        public var userItems: UserItems {
          get {
            return UserItems(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class DeleteSubjectMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation deleteSubject($name: String!) {
      deleteSubject(name: $name) {
        __typename
        ...SubjectItems
      }
    }
    """

  public let operationName: String = "deleteSubject"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + SubjectItems.fragmentDefinition)
    return document
  }

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteSubject", arguments: ["name": GraphQLVariable("name")], type: .object(DeleteSubject.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteSubject: DeleteSubject? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteSubject": deleteSubject.flatMap { (value: DeleteSubject) -> ResultMap in value.resultMap }])
    }

    public var deleteSubject: DeleteSubject? {
      get {
        return (resultMap["deleteSubject"] as? ResultMap).flatMap { DeleteSubject(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteSubject")
      }
    }

    public struct DeleteSubject: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Subject"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(SubjectItems.self),
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

        public var subjectItems: SubjectItems {
          get {
            return SubjectItems(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class DeleteUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation deleteUser($id: String!) {
      deleteUser(id: $id) {
        __typename
        id
        username
        instrument
      }
    }
    """

  public let operationName: String = "deleteUser"

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteUser", arguments: ["id": GraphQLVariable("id")], type: .object(DeleteUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteUser: DeleteUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteUser": deleteUser.flatMap { (value: DeleteUser) -> ResultMap in value.resultMap }])
    }

    public var deleteUser: DeleteUser? {
      get {
        return (resultMap["deleteUser"] as? ResultMap).flatMap { DeleteUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteUser")
      }
    }

    public struct DeleteUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("instrument", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, username: String, instrument: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "instrument": instrument])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var instrument: String? {
        get {
          return resultMap["instrument"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "instrument")
        }
      }
    }
  }
}

public final class LogOutMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation logOut {
      logOut
    }
    """

  public let operationName: String = "logOut"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("logOut", type: .nonNull(.scalar(Bool.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(logOut: Bool) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "logOut": logOut])
    }

    public var logOut: Bool {
      get {
        return resultMap["logOut"]! as! Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "logOut")
      }
    }
  }
}

public final class AddUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation addUser($username: String!, $instrument: String, $password: String!) {
      addUser(username: $username, password: $password, instrument: $instrument) {
        __typename
        id
        username
        instrument
      }
    }
    """

  public let operationName: String = "addUser"

  public var username: String
  public var instrument: String?
  public var password: String

  public init(username: String, instrument: String? = nil, password: String) {
    self.username = username
    self.instrument = instrument
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["username": username, "instrument": instrument, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addUser", arguments: ["username": GraphQLVariable("username"), "password": GraphQLVariable("password"), "instrument": GraphQLVariable("instrument")], type: .object(AddUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addUser: AddUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addUser": addUser.flatMap { (value: AddUser) -> ResultMap in value.resultMap }])
    }

    public var addUser: AddUser? {
      get {
        return (resultMap["addUser"] as? ResultMap).flatMap { AddUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addUser")
      }
    }

    public struct AddUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("instrument", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, username: String, instrument: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "instrument": instrument])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var instrument: String? {
        get {
          return resultMap["instrument"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "instrument")
        }
      }
    }
  }
}

public final class AddSubjectMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation addSubject($name: String!, $description: String, $userID: String, $links: SubjectLinkInput) {
      addSubject(
        name: $name
        description: $description
        userID: $userID
        links: $links
      ) {
        __typename
        name
        description
        id
        links {
          __typename
          url
          description
        }
      }
    }
    """

  public let operationName: String = "addSubject"

  public var name: String
  public var description: String?
  public var userID: String?
  public var links: SubjectLinkInput?

  public init(name: String, description: String? = nil, userID: String? = nil, links: SubjectLinkInput? = nil) {
    self.name = name
    self.description = description
    self.userID = userID
    self.links = links
  }

  public var variables: GraphQLMap? {
    return ["name": name, "description": description, "userID": userID, "links": links]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addSubject", arguments: ["name": GraphQLVariable("name"), "description": GraphQLVariable("description"), "userID": GraphQLVariable("userID"), "links": GraphQLVariable("links")], type: .object(AddSubject.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addSubject: AddSubject? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addSubject": addSubject.flatMap { (value: AddSubject) -> ResultMap in value.resultMap }])
    }

    public var addSubject: AddSubject? {
      get {
        return (resultMap["addSubject"] as? ResultMap).flatMap { AddSubject(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addSubject")
      }
    }

    public struct AddSubject: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Subject"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("links", type: .list(.object(Link.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, description: String? = nil, id: GraphQLID, links: [Link?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Subject", "name": name, "description": description, "id": id, "links": links.flatMap { (value: [Link?]) -> [ResultMap?] in value.map { (value: Link?) -> ResultMap? in value.flatMap { (value: Link) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var links: [Link?]? {
        get {
          return (resultMap["links"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Link?] in value.map { (value: ResultMap?) -> Link? in value.flatMap { (value: ResultMap) -> Link in Link(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Link?]) -> [ResultMap?] in value.map { (value: Link?) -> ResultMap? in value.flatMap { (value: Link) -> ResultMap in value.resultMap } } }, forKey: "links")
        }
      }

      public struct Link: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SubjectLink"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(url: String, description: String) {
          self.init(unsafeResultMap: ["__typename": "SubjectLink", "url": url, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var url: String {
          get {
            return resultMap["url"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }
    }
  }
}

public final class AddLinkMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation addLink($url: String!, $description: String!, $subjectID: String!) {
      addLink(url: $url, description: $description, subjectID: $subjectID) {
        __typename
        ...SubjectItems
      }
    }
    """

  public let operationName: String = "addLink"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + SubjectItems.fragmentDefinition)
    return document
  }

  public var url: String
  public var description: String
  public var subjectID: String

  public init(url: String, description: String, subjectID: String) {
    self.url = url
    self.description = description
    self.subjectID = subjectID
  }

  public var variables: GraphQLMap? {
    return ["url": url, "description": description, "subjectID": subjectID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addLink", arguments: ["url": GraphQLVariable("url"), "description": GraphQLVariable("description"), "subjectID": GraphQLVariable("subjectID")], type: .object(AddLink.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addLink: AddLink? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addLink": addLink.flatMap { (value: AddLink) -> ResultMap in value.resultMap }])
    }

    public var addLink: AddLink? {
      get {
        return (resultMap["addLink"] as? ResultMap).flatMap { AddLink(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addLink")
      }
    }

    public struct AddLink: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Subject"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(SubjectItems.self),
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

        public var subjectItems: SubjectItems {
          get {
            return SubjectItems(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation login($username: String!, $password: String!) {
      login(username: $username, password: $password) {
        __typename
        token
        user {
          __typename
          username
        }
      }
    }
    """

  public let operationName: String = "login"

  public var username: String
  public var password: String

  public init(username: String, password: String) {
    self.username = username
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["username": username, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["username": GraphQLVariable("username"), "password": GraphQLVariable("password")], type: .object(Login.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.flatMap { (value: Login) -> ResultMap in value.resultMap }])
    }

    public var login: Login? {
      get {
        return (resultMap["login"] as? ResultMap).flatMap { Login(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("user", type: .object(User.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String, user: User? = nil) {
        self.init(unsafeResultMap: ["__typename": "AuthPayload", "token": token, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("username", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(username: String) {
          self.init(unsafeResultMap: ["__typename": "User", "username": username])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var username: String {
          get {
            return resultMap["username"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }
      }
    }
  }
}

public final class GetSubjectsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getSubjects {
      allSubjects {
        __typename
        id
        name
        description
        timePracticed
        links {
          __typename
          url
          description
        }
      }
    }
    """

  public let operationName: String = "getSubjects"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allSubjects", type: .list(.object(AllSubject.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allSubjects: [AllSubject?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "allSubjects": allSubjects.flatMap { (value: [AllSubject?]) -> [ResultMap?] in value.map { (value: AllSubject?) -> ResultMap? in value.flatMap { (value: AllSubject) -> ResultMap in value.resultMap } } }])
    }

    public var allSubjects: [AllSubject?]? {
      get {
        return (resultMap["allSubjects"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AllSubject?] in value.map { (value: ResultMap?) -> AllSubject? in value.flatMap { (value: ResultMap) -> AllSubject in AllSubject(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [AllSubject?]) -> [ResultMap?] in value.map { (value: AllSubject?) -> ResultMap? in value.flatMap { (value: AllSubject) -> ResultMap in value.resultMap } } }, forKey: "allSubjects")
      }
    }

    public struct AllSubject: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Subject"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("timePracticed", type: .nonNull(.scalar(Int.self))),
          GraphQLField("links", type: .list(.object(Link.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String? = nil, description: String? = nil, timePracticed: Int, links: [Link?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Subject", "id": id, "name": name, "description": description, "timePracticed": timePracticed, "links": links.flatMap { (value: [Link?]) -> [ResultMap?] in value.map { (value: Link?) -> ResultMap? in value.flatMap { (value: Link) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var timePracticed: Int {
        get {
          return resultMap["timePracticed"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "timePracticed")
        }
      }

      public var links: [Link?]? {
        get {
          return (resultMap["links"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Link?] in value.map { (value: ResultMap?) -> Link? in value.flatMap { (value: ResultMap) -> Link in Link(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Link?]) -> [ResultMap?] in value.map { (value: Link?) -> ResultMap? in value.flatMap { (value: Link) -> ResultMap in value.resultMap } } }, forKey: "links")
        }
      }

      public struct Link: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SubjectLink"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(url: String, description: String) {
          self.init(unsafeResultMap: ["__typename": "SubjectLink", "url": url, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var url: String {
          get {
            return resultMap["url"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }
    }
  }
}

public final class GetUsersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getUsers {
      allUsers {
        __typename
        id
        username
        instrument
        joined
        goals {
          __typename
          id
          description
          subject
          targetTime
          elapsedTime
          deadline
          passed
        }
        mySubjects {
          __typename
          subjectID
          subjectName
          timePracticed
          subjectNotes {
            __typename
            date
            notes
          }
        }
        sessions {
          __typename
          id
          date
          totalLength
          notes
          userID
          individualSubjects {
            __typename
            name
            length
          }
        }
      }
    }
    """

  public let operationName: String = "getUsers"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allUsers", type: .list(.object(AllUser.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allUsers: [AllUser?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "allUsers": allUsers.flatMap { (value: [AllUser?]) -> [ResultMap?] in value.map { (value: AllUser?) -> ResultMap? in value.flatMap { (value: AllUser) -> ResultMap in value.resultMap } } }])
    }

    public var allUsers: [AllUser?]? {
      get {
        return (resultMap["allUsers"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AllUser?] in value.map { (value: ResultMap?) -> AllUser? in value.flatMap { (value: ResultMap) -> AllUser in AllUser(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [AllUser?]) -> [ResultMap?] in value.map { (value: AllUser?) -> ResultMap? in value.flatMap { (value: AllUser) -> ResultMap in value.resultMap } } }, forKey: "allUsers")
      }
    }

    public struct AllUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("instrument", type: .scalar(String.self)),
          GraphQLField("joined", type: .nonNull(.scalar(String.self))),
          GraphQLField("goals", type: .list(.object(Goal.selections))),
          GraphQLField("mySubjects", type: .list(.object(MySubject.selections))),
          GraphQLField("sessions", type: .list(.object(Session.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, username: String, instrument: String? = nil, joined: String, goals: [Goal?]? = nil, mySubjects: [MySubject?]? = nil, sessions: [Session?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "instrument": instrument, "joined": joined, "goals": goals.flatMap { (value: [Goal?]) -> [ResultMap?] in value.map { (value: Goal?) -> ResultMap? in value.flatMap { (value: Goal) -> ResultMap in value.resultMap } } }, "mySubjects": mySubjects.flatMap { (value: [MySubject?]) -> [ResultMap?] in value.map { (value: MySubject?) -> ResultMap? in value.flatMap { (value: MySubject) -> ResultMap in value.resultMap } } }, "sessions": sessions.flatMap { (value: [Session?]) -> [ResultMap?] in value.map { (value: Session?) -> ResultMap? in value.flatMap { (value: Session) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var instrument: String? {
        get {
          return resultMap["instrument"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "instrument")
        }
      }

      public var joined: String {
        get {
          return resultMap["joined"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "joined")
        }
      }

      public var goals: [Goal?]? {
        get {
          return (resultMap["goals"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Goal?] in value.map { (value: ResultMap?) -> Goal? in value.flatMap { (value: ResultMap) -> Goal in Goal(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Goal?]) -> [ResultMap?] in value.map { (value: Goal?) -> ResultMap? in value.flatMap { (value: Goal) -> ResultMap in value.resultMap } } }, forKey: "goals")
        }
      }

      public var mySubjects: [MySubject?]? {
        get {
          return (resultMap["mySubjects"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [MySubject?] in value.map { (value: ResultMap?) -> MySubject? in value.flatMap { (value: ResultMap) -> MySubject in MySubject(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [MySubject?]) -> [ResultMap?] in value.map { (value: MySubject?) -> ResultMap? in value.flatMap { (value: MySubject) -> ResultMap in value.resultMap } } }, forKey: "mySubjects")
        }
      }

      public var sessions: [Session?]? {
        get {
          return (resultMap["sessions"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Session?] in value.map { (value: ResultMap?) -> Session? in value.flatMap { (value: ResultMap) -> Session in Session(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Session?]) -> [ResultMap?] in value.map { (value: Session?) -> ResultMap? in value.flatMap { (value: Session) -> ResultMap in value.resultMap } } }, forKey: "sessions")
        }
      }

      public struct Goal: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Goal"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("subject", type: .nonNull(.scalar(String.self))),
            GraphQLField("targetTime", type: .nonNull(.scalar(Int.self))),
            GraphQLField("elapsedTime", type: .nonNull(.scalar(Int.self))),
            GraphQLField("deadline", type: .scalar(String.self)),
            GraphQLField("passed", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, description: String, subject: String, targetTime: Int, elapsedTime: Int, deadline: String? = nil, passed: Bool) {
          self.init(unsafeResultMap: ["__typename": "Goal", "id": id, "description": description, "subject": subject, "targetTime": targetTime, "elapsedTime": elapsedTime, "deadline": deadline, "passed": passed])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var subject: String {
          get {
            return resultMap["subject"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "subject")
          }
        }

        public var targetTime: Int {
          get {
            return resultMap["targetTime"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "targetTime")
          }
        }

        public var elapsedTime: Int {
          get {
            return resultMap["elapsedTime"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "elapsedTime")
          }
        }

        public var deadline: String? {
          get {
            return resultMap["deadline"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "deadline")
          }
        }

        public var passed: Bool {
          get {
            return resultMap["passed"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "passed")
          }
        }
      }

      public struct MySubject: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MySubject"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("subjectID", type: .nonNull(.scalar(String.self))),
            GraphQLField("subjectName", type: .nonNull(.scalar(String.self))),
            GraphQLField("timePracticed", type: .nonNull(.scalar(Int.self))),
            GraphQLField("subjectNotes", type: .list(.object(SubjectNote.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(subjectId: String, subjectName: String, timePracticed: Int, subjectNotes: [SubjectNote?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "MySubject", "subjectID": subjectId, "subjectName": subjectName, "timePracticed": timePracticed, "subjectNotes": subjectNotes.flatMap { (value: [SubjectNote?]) -> [ResultMap?] in value.map { (value: SubjectNote?) -> ResultMap? in value.flatMap { (value: SubjectNote) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var subjectId: String {
          get {
            return resultMap["subjectID"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "subjectID")
          }
        }

        public var subjectName: String {
          get {
            return resultMap["subjectName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "subjectName")
          }
        }

        public var timePracticed: Int {
          get {
            return resultMap["timePracticed"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "timePracticed")
          }
        }

        public var subjectNotes: [SubjectNote?]? {
          get {
            return (resultMap["subjectNotes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SubjectNote?] in value.map { (value: ResultMap?) -> SubjectNote? in value.flatMap { (value: ResultMap) -> SubjectNote in SubjectNote(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [SubjectNote?]) -> [ResultMap?] in value.map { (value: SubjectNote?) -> ResultMap? in value.flatMap { (value: SubjectNote) -> ResultMap in value.resultMap } } }, forKey: "subjectNotes")
          }
        }

        public struct SubjectNote: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["SubjectNote"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("date", type: .nonNull(.scalar(String.self))),
              GraphQLField("notes", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(date: String, notes: String) {
            self.init(unsafeResultMap: ["__typename": "SubjectNote", "date": date, "notes": notes])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var date: String {
            get {
              return resultMap["date"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "date")
            }
          }

          public var notes: String {
            get {
              return resultMap["notes"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "notes")
            }
          }
        }
      }

      public struct Session: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Session"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("date", type: .nonNull(.scalar(String.self))),
            GraphQLField("totalLength", type: .scalar(Int.self)),
            GraphQLField("notes", type: .scalar(String.self)),
            GraphQLField("userID", type: .nonNull(.scalar(String.self))),
            GraphQLField("individualSubjects", type: .list(.object(IndividualSubject.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, date: String, totalLength: Int? = nil, notes: String? = nil, userId: String, individualSubjects: [IndividualSubject?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Session", "id": id, "date": date, "totalLength": totalLength, "notes": notes, "userID": userId, "individualSubjects": individualSubjects.flatMap { (value: [IndividualSubject?]) -> [ResultMap?] in value.map { (value: IndividualSubject?) -> ResultMap? in value.flatMap { (value: IndividualSubject) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var date: String {
          get {
            return resultMap["date"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "date")
          }
        }

        public var totalLength: Int? {
          get {
            return resultMap["totalLength"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalLength")
          }
        }

        public var notes: String? {
          get {
            return resultMap["notes"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "notes")
          }
        }

        public var userId: String {
          get {
            return resultMap["userID"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "userID")
          }
        }

        public var individualSubjects: [IndividualSubject?]? {
          get {
            return (resultMap["individualSubjects"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [IndividualSubject?] in value.map { (value: ResultMap?) -> IndividualSubject? in value.flatMap { (value: ResultMap) -> IndividualSubject in IndividualSubject(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [IndividualSubject?]) -> [ResultMap?] in value.map { (value: IndividualSubject?) -> ResultMap? in value.flatMap { (value: IndividualSubject) -> ResultMap in value.resultMap } } }, forKey: "individualSubjects")
          }
        }

        public struct IndividualSubject: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["SessionSubject"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("length", type: .nonNull(.scalar(Int.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, length: Int) {
            self.init(unsafeResultMap: ["__typename": "SessionSubject", "name": name, "length": length])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var length: Int {
            get {
              return resultMap["length"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "length")
            }
          }
        }
      }
    }
  }
}

public final class GetSessionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getSessions($userID: String) {
      allSessions(userID: $userID) {
        __typename
        id
        date
        totalLength
        notes
        userID
        individualSubjects {
          __typename
          name
          length
        }
      }
    }
    """

  public let operationName: String = "getSessions"

  public var userID: String?

  public init(userID: String? = nil) {
    self.userID = userID
  }

  public var variables: GraphQLMap? {
    return ["userID": userID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allSessions", arguments: ["userID": GraphQLVariable("userID")], type: .list(.object(AllSession.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allSessions: [AllSession?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "allSessions": allSessions.flatMap { (value: [AllSession?]) -> [ResultMap?] in value.map { (value: AllSession?) -> ResultMap? in value.flatMap { (value: AllSession) -> ResultMap in value.resultMap } } }])
    }

    public var allSessions: [AllSession?]? {
      get {
        return (resultMap["allSessions"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AllSession?] in value.map { (value: ResultMap?) -> AllSession? in value.flatMap { (value: ResultMap) -> AllSession in AllSession(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [AllSession?]) -> [ResultMap?] in value.map { (value: AllSession?) -> ResultMap? in value.flatMap { (value: AllSession) -> ResultMap in value.resultMap } } }, forKey: "allSessions")
      }
    }

    public struct AllSession: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Session"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("date", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalLength", type: .scalar(Int.self)),
          GraphQLField("notes", type: .scalar(String.self)),
          GraphQLField("userID", type: .nonNull(.scalar(String.self))),
          GraphQLField("individualSubjects", type: .list(.object(IndividualSubject.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, date: String, totalLength: Int? = nil, notes: String? = nil, userId: String, individualSubjects: [IndividualSubject?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Session", "id": id, "date": date, "totalLength": totalLength, "notes": notes, "userID": userId, "individualSubjects": individualSubjects.flatMap { (value: [IndividualSubject?]) -> [ResultMap?] in value.map { (value: IndividualSubject?) -> ResultMap? in value.flatMap { (value: IndividualSubject) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var date: String {
        get {
          return resultMap["date"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date")
        }
      }

      public var totalLength: Int? {
        get {
          return resultMap["totalLength"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalLength")
        }
      }

      public var notes: String? {
        get {
          return resultMap["notes"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "notes")
        }
      }

      public var userId: String {
        get {
          return resultMap["userID"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userID")
        }
      }

      public var individualSubjects: [IndividualSubject?]? {
        get {
          return (resultMap["individualSubjects"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [IndividualSubject?] in value.map { (value: ResultMap?) -> IndividualSubject? in value.flatMap { (value: ResultMap) -> IndividualSubject in IndividualSubject(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [IndividualSubject?]) -> [ResultMap?] in value.map { (value: IndividualSubject?) -> ResultMap? in value.flatMap { (value: IndividualSubject) -> ResultMap in value.resultMap } } }, forKey: "individualSubjects")
        }
      }

      public struct IndividualSubject: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SessionSubject"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("length", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, length: Int) {
          self.init(unsafeResultMap: ["__typename": "SessionSubject", "name": name, "length": length])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var length: Int {
          get {
            return resultMap["length"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "length")
          }
        }
      }
    }
  }
}

public final class CurrentUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query currentUser {
      me {
        __typename
        id
        username
        instrument
        timePracticed
        joined
        goals {
          __typename
          id
          description
          subject
          targetTime
          elapsedTime
          deadline
          passed
        }
        mySubjects {
          __typename
          subjectID
          subjectName
          timePracticed
          subjectNotes {
            __typename
            date
            notes
          }
        }
        sessions {
          __typename
          id
          date
          totalLength
          notes
          userID
          individualSubjects {
            __typename
            name
            length
          }
        }
      }
    }
    """

  public let operationName: String = "currentUser"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("me", type: .object(Me.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
    }

    public var me: Me? {
      get {
        return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("instrument", type: .scalar(String.self)),
          GraphQLField("timePracticed", type: .nonNull(.scalar(Int.self))),
          GraphQLField("joined", type: .nonNull(.scalar(String.self))),
          GraphQLField("goals", type: .list(.object(Goal.selections))),
          GraphQLField("mySubjects", type: .list(.object(MySubject.selections))),
          GraphQLField("sessions", type: .list(.object(Session.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, username: String, instrument: String? = nil, timePracticed: Int, joined: String, goals: [Goal?]? = nil, mySubjects: [MySubject?]? = nil, sessions: [Session?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "instrument": instrument, "timePracticed": timePracticed, "joined": joined, "goals": goals.flatMap { (value: [Goal?]) -> [ResultMap?] in value.map { (value: Goal?) -> ResultMap? in value.flatMap { (value: Goal) -> ResultMap in value.resultMap } } }, "mySubjects": mySubjects.flatMap { (value: [MySubject?]) -> [ResultMap?] in value.map { (value: MySubject?) -> ResultMap? in value.flatMap { (value: MySubject) -> ResultMap in value.resultMap } } }, "sessions": sessions.flatMap { (value: [Session?]) -> [ResultMap?] in value.map { (value: Session?) -> ResultMap? in value.flatMap { (value: Session) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var instrument: String? {
        get {
          return resultMap["instrument"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "instrument")
        }
      }

      public var timePracticed: Int {
        get {
          return resultMap["timePracticed"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "timePracticed")
        }
      }

      public var joined: String {
        get {
          return resultMap["joined"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "joined")
        }
      }

      public var goals: [Goal?]? {
        get {
          return (resultMap["goals"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Goal?] in value.map { (value: ResultMap?) -> Goal? in value.flatMap { (value: ResultMap) -> Goal in Goal(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Goal?]) -> [ResultMap?] in value.map { (value: Goal?) -> ResultMap? in value.flatMap { (value: Goal) -> ResultMap in value.resultMap } } }, forKey: "goals")
        }
      }

      public var mySubjects: [MySubject?]? {
        get {
          return (resultMap["mySubjects"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [MySubject?] in value.map { (value: ResultMap?) -> MySubject? in value.flatMap { (value: ResultMap) -> MySubject in MySubject(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [MySubject?]) -> [ResultMap?] in value.map { (value: MySubject?) -> ResultMap? in value.flatMap { (value: MySubject) -> ResultMap in value.resultMap } } }, forKey: "mySubjects")
        }
      }

      public var sessions: [Session?]? {
        get {
          return (resultMap["sessions"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Session?] in value.map { (value: ResultMap?) -> Session? in value.flatMap { (value: ResultMap) -> Session in Session(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Session?]) -> [ResultMap?] in value.map { (value: Session?) -> ResultMap? in value.flatMap { (value: Session) -> ResultMap in value.resultMap } } }, forKey: "sessions")
        }
      }

      public struct Goal: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Goal"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("subject", type: .nonNull(.scalar(String.self))),
            GraphQLField("targetTime", type: .nonNull(.scalar(Int.self))),
            GraphQLField("elapsedTime", type: .nonNull(.scalar(Int.self))),
            GraphQLField("deadline", type: .scalar(String.self)),
            GraphQLField("passed", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, description: String, subject: String, targetTime: Int, elapsedTime: Int, deadline: String? = nil, passed: Bool) {
          self.init(unsafeResultMap: ["__typename": "Goal", "id": id, "description": description, "subject": subject, "targetTime": targetTime, "elapsedTime": elapsedTime, "deadline": deadline, "passed": passed])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var subject: String {
          get {
            return resultMap["subject"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "subject")
          }
        }

        public var targetTime: Int {
          get {
            return resultMap["targetTime"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "targetTime")
          }
        }

        public var elapsedTime: Int {
          get {
            return resultMap["elapsedTime"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "elapsedTime")
          }
        }

        public var deadline: String? {
          get {
            return resultMap["deadline"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "deadline")
          }
        }

        public var passed: Bool {
          get {
            return resultMap["passed"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "passed")
          }
        }
      }

      public struct MySubject: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MySubject"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("subjectID", type: .nonNull(.scalar(String.self))),
            GraphQLField("subjectName", type: .nonNull(.scalar(String.self))),
            GraphQLField("timePracticed", type: .nonNull(.scalar(Int.self))),
            GraphQLField("subjectNotes", type: .list(.object(SubjectNote.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(subjectId: String, subjectName: String, timePracticed: Int, subjectNotes: [SubjectNote?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "MySubject", "subjectID": subjectId, "subjectName": subjectName, "timePracticed": timePracticed, "subjectNotes": subjectNotes.flatMap { (value: [SubjectNote?]) -> [ResultMap?] in value.map { (value: SubjectNote?) -> ResultMap? in value.flatMap { (value: SubjectNote) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var subjectId: String {
          get {
            return resultMap["subjectID"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "subjectID")
          }
        }

        public var subjectName: String {
          get {
            return resultMap["subjectName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "subjectName")
          }
        }

        public var timePracticed: Int {
          get {
            return resultMap["timePracticed"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "timePracticed")
          }
        }

        public var subjectNotes: [SubjectNote?]? {
          get {
            return (resultMap["subjectNotes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SubjectNote?] in value.map { (value: ResultMap?) -> SubjectNote? in value.flatMap { (value: ResultMap) -> SubjectNote in SubjectNote(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [SubjectNote?]) -> [ResultMap?] in value.map { (value: SubjectNote?) -> ResultMap? in value.flatMap { (value: SubjectNote) -> ResultMap in value.resultMap } } }, forKey: "subjectNotes")
          }
        }

        public struct SubjectNote: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["SubjectNote"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("date", type: .nonNull(.scalar(String.self))),
              GraphQLField("notes", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(date: String, notes: String) {
            self.init(unsafeResultMap: ["__typename": "SubjectNote", "date": date, "notes": notes])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var date: String {
            get {
              return resultMap["date"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "date")
            }
          }

          public var notes: String {
            get {
              return resultMap["notes"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "notes")
            }
          }
        }
      }

      public struct Session: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Session"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("date", type: .nonNull(.scalar(String.self))),
            GraphQLField("totalLength", type: .scalar(Int.self)),
            GraphQLField("notes", type: .scalar(String.self)),
            GraphQLField("userID", type: .nonNull(.scalar(String.self))),
            GraphQLField("individualSubjects", type: .list(.object(IndividualSubject.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, date: String, totalLength: Int? = nil, notes: String? = nil, userId: String, individualSubjects: [IndividualSubject?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Session", "id": id, "date": date, "totalLength": totalLength, "notes": notes, "userID": userId, "individualSubjects": individualSubjects.flatMap { (value: [IndividualSubject?]) -> [ResultMap?] in value.map { (value: IndividualSubject?) -> ResultMap? in value.flatMap { (value: IndividualSubject) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var date: String {
          get {
            return resultMap["date"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "date")
          }
        }

        public var totalLength: Int? {
          get {
            return resultMap["totalLength"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalLength")
          }
        }

        public var notes: String? {
          get {
            return resultMap["notes"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "notes")
          }
        }

        public var userId: String {
          get {
            return resultMap["userID"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "userID")
          }
        }

        public var individualSubjects: [IndividualSubject?]? {
          get {
            return (resultMap["individualSubjects"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [IndividualSubject?] in value.map { (value: ResultMap?) -> IndividualSubject? in value.flatMap { (value: ResultMap) -> IndividualSubject in IndividualSubject(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [IndividualSubject?]) -> [ResultMap?] in value.map { (value: IndividualSubject?) -> ResultMap? in value.flatMap { (value: IndividualSubject) -> ResultMap in value.resultMap } } }, forKey: "individualSubjects")
          }
        }

        public struct IndividualSubject: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["SessionSubject"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("length", type: .nonNull(.scalar(Int.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, length: Int) {
            self.init(unsafeResultMap: ["__typename": "SessionSubject", "name": name, "length": length])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var length: Int {
            get {
              return resultMap["length"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "length")
            }
          }
        }
      }
    }
  }
}

public struct SessionItems: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment SessionItems on Session {
      __typename
      id
      date
      totalLength
      notes
      userID
      individualSubjects {
        __typename
        name
        length
      }
    }
    """

  public static let possibleTypes: [String] = ["Session"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("date", type: .nonNull(.scalar(String.self))),
      GraphQLField("totalLength", type: .scalar(Int.self)),
      GraphQLField("notes", type: .scalar(String.self)),
      GraphQLField("userID", type: .nonNull(.scalar(String.self))),
      GraphQLField("individualSubjects", type: .list(.object(IndividualSubject.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, date: String, totalLength: Int? = nil, notes: String? = nil, userId: String, individualSubjects: [IndividualSubject?]? = nil) {
    self.init(unsafeResultMap: ["__typename": "Session", "id": id, "date": date, "totalLength": totalLength, "notes": notes, "userID": userId, "individualSubjects": individualSubjects.flatMap { (value: [IndividualSubject?]) -> [ResultMap?] in value.map { (value: IndividualSubject?) -> ResultMap? in value.flatMap { (value: IndividualSubject) -> ResultMap in value.resultMap } } }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var date: String {
    get {
      return resultMap["date"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "date")
    }
  }

  public var totalLength: Int? {
    get {
      return resultMap["totalLength"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "totalLength")
    }
  }

  public var notes: String? {
    get {
      return resultMap["notes"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "notes")
    }
  }

  public var userId: String {
    get {
      return resultMap["userID"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "userID")
    }
  }

  public var individualSubjects: [IndividualSubject?]? {
    get {
      return (resultMap["individualSubjects"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [IndividualSubject?] in value.map { (value: ResultMap?) -> IndividualSubject? in value.flatMap { (value: ResultMap) -> IndividualSubject in IndividualSubject(unsafeResultMap: value) } } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [IndividualSubject?]) -> [ResultMap?] in value.map { (value: IndividualSubject?) -> ResultMap? in value.flatMap { (value: IndividualSubject) -> ResultMap in value.resultMap } } }, forKey: "individualSubjects")
    }
  }

  public struct IndividualSubject: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["SessionSubject"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("length", type: .nonNull(.scalar(Int.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String, length: Int) {
      self.init(unsafeResultMap: ["__typename": "SessionSubject", "name": name, "length": length])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var length: Int {
      get {
        return resultMap["length"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "length")
      }
    }
  }
}

public struct SubjectItems: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment SubjectItems on Subject {
      __typename
      id
      name
      description
      timePracticed
      links {
        __typename
        url
        description
      }
    }
    """

  public static let possibleTypes: [String] = ["Subject"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("description", type: .scalar(String.self)),
      GraphQLField("timePracticed", type: .nonNull(.scalar(Int.self))),
      GraphQLField("links", type: .list(.object(Link.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String? = nil, description: String? = nil, timePracticed: Int, links: [Link?]? = nil) {
    self.init(unsafeResultMap: ["__typename": "Subject", "id": id, "name": name, "description": description, "timePracticed": timePracticed, "links": links.flatMap { (value: [Link?]) -> [ResultMap?] in value.map { (value: Link?) -> ResultMap? in value.flatMap { (value: Link) -> ResultMap in value.resultMap } } }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var description: String? {
    get {
      return resultMap["description"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  public var timePracticed: Int {
    get {
      return resultMap["timePracticed"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "timePracticed")
    }
  }

  public var links: [Link?]? {
    get {
      return (resultMap["links"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Link?] in value.map { (value: ResultMap?) -> Link? in value.flatMap { (value: ResultMap) -> Link in Link(unsafeResultMap: value) } } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Link?]) -> [ResultMap?] in value.map { (value: Link?) -> ResultMap? in value.flatMap { (value: Link) -> ResultMap in value.resultMap } } }, forKey: "links")
    }
  }

  public struct Link: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["SubjectLink"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("url", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(url: String, description: String) {
      self.init(unsafeResultMap: ["__typename": "SubjectLink", "url": url, "description": description])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var url: String {
      get {
        return resultMap["url"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "url")
      }
    }

    public var description: String {
      get {
        return resultMap["description"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "description")
      }
    }
  }
}

public struct UserItems: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment UserItems on User {
      __typename
      id
      username
      instrument
      joined
      goals {
        __typename
        id
        description
        subject
        targetTime
        elapsedTime
        deadline
        passed
      }
      mySubjects {
        __typename
        subjectID
        subjectName
        timePracticed
        subjectNotes {
          __typename
          date
          notes
        }
      }
      sessions {
        __typename
        ...SessionItems
      }
    }
    """

  public static let possibleTypes: [String] = ["User"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("username", type: .nonNull(.scalar(String.self))),
      GraphQLField("instrument", type: .scalar(String.self)),
      GraphQLField("joined", type: .nonNull(.scalar(String.self))),
      GraphQLField("goals", type: .list(.object(Goal.selections))),
      GraphQLField("mySubjects", type: .list(.object(MySubject.selections))),
      GraphQLField("sessions", type: .list(.object(Session.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, username: String, instrument: String? = nil, joined: String, goals: [Goal?]? = nil, mySubjects: [MySubject?]? = nil, sessions: [Session?]? = nil) {
    self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "instrument": instrument, "joined": joined, "goals": goals.flatMap { (value: [Goal?]) -> [ResultMap?] in value.map { (value: Goal?) -> ResultMap? in value.flatMap { (value: Goal) -> ResultMap in value.resultMap } } }, "mySubjects": mySubjects.flatMap { (value: [MySubject?]) -> [ResultMap?] in value.map { (value: MySubject?) -> ResultMap? in value.flatMap { (value: MySubject) -> ResultMap in value.resultMap } } }, "sessions": sessions.flatMap { (value: [Session?]) -> [ResultMap?] in value.map { (value: Session?) -> ResultMap? in value.flatMap { (value: Session) -> ResultMap in value.resultMap } } }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var username: String {
    get {
      return resultMap["username"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "username")
    }
  }

  public var instrument: String? {
    get {
      return resultMap["instrument"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "instrument")
    }
  }

  public var joined: String {
    get {
      return resultMap["joined"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "joined")
    }
  }

  public var goals: [Goal?]? {
    get {
      return (resultMap["goals"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Goal?] in value.map { (value: ResultMap?) -> Goal? in value.flatMap { (value: ResultMap) -> Goal in Goal(unsafeResultMap: value) } } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Goal?]) -> [ResultMap?] in value.map { (value: Goal?) -> ResultMap? in value.flatMap { (value: Goal) -> ResultMap in value.resultMap } } }, forKey: "goals")
    }
  }

  public var mySubjects: [MySubject?]? {
    get {
      return (resultMap["mySubjects"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [MySubject?] in value.map { (value: ResultMap?) -> MySubject? in value.flatMap { (value: ResultMap) -> MySubject in MySubject(unsafeResultMap: value) } } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [MySubject?]) -> [ResultMap?] in value.map { (value: MySubject?) -> ResultMap? in value.flatMap { (value: MySubject) -> ResultMap in value.resultMap } } }, forKey: "mySubjects")
    }
  }

  public var sessions: [Session?]? {
    get {
      return (resultMap["sessions"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Session?] in value.map { (value: ResultMap?) -> Session? in value.flatMap { (value: ResultMap) -> Session in Session(unsafeResultMap: value) } } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Session?]) -> [ResultMap?] in value.map { (value: Session?) -> ResultMap? in value.flatMap { (value: Session) -> ResultMap in value.resultMap } } }, forKey: "sessions")
    }
  }

  public struct Goal: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Goal"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("subject", type: .nonNull(.scalar(String.self))),
        GraphQLField("targetTime", type: .nonNull(.scalar(Int.self))),
        GraphQLField("elapsedTime", type: .nonNull(.scalar(Int.self))),
        GraphQLField("deadline", type: .scalar(String.self)),
        GraphQLField("passed", type: .nonNull(.scalar(Bool.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, description: String, subject: String, targetTime: Int, elapsedTime: Int, deadline: String? = nil, passed: Bool) {
      self.init(unsafeResultMap: ["__typename": "Goal", "id": id, "description": description, "subject": subject, "targetTime": targetTime, "elapsedTime": elapsedTime, "deadline": deadline, "passed": passed])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var description: String {
      get {
        return resultMap["description"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "description")
      }
    }

    public var subject: String {
      get {
        return resultMap["subject"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "subject")
      }
    }

    public var targetTime: Int {
      get {
        return resultMap["targetTime"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "targetTime")
      }
    }

    public var elapsedTime: Int {
      get {
        return resultMap["elapsedTime"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "elapsedTime")
      }
    }

    public var deadline: String? {
      get {
        return resultMap["deadline"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "deadline")
      }
    }

    public var passed: Bool {
      get {
        return resultMap["passed"]! as! Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "passed")
      }
    }
  }

  public struct MySubject: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["MySubject"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("subjectID", type: .nonNull(.scalar(String.self))),
        GraphQLField("subjectName", type: .nonNull(.scalar(String.self))),
        GraphQLField("timePracticed", type: .nonNull(.scalar(Int.self))),
        GraphQLField("subjectNotes", type: .list(.object(SubjectNote.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(subjectId: String, subjectName: String, timePracticed: Int, subjectNotes: [SubjectNote?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "MySubject", "subjectID": subjectId, "subjectName": subjectName, "timePracticed": timePracticed, "subjectNotes": subjectNotes.flatMap { (value: [SubjectNote?]) -> [ResultMap?] in value.map { (value: SubjectNote?) -> ResultMap? in value.flatMap { (value: SubjectNote) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var subjectId: String {
      get {
        return resultMap["subjectID"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "subjectID")
      }
    }

    public var subjectName: String {
      get {
        return resultMap["subjectName"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "subjectName")
      }
    }

    public var timePracticed: Int {
      get {
        return resultMap["timePracticed"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "timePracticed")
      }
    }

    public var subjectNotes: [SubjectNote?]? {
      get {
        return (resultMap["subjectNotes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SubjectNote?] in value.map { (value: ResultMap?) -> SubjectNote? in value.flatMap { (value: ResultMap) -> SubjectNote in SubjectNote(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SubjectNote?]) -> [ResultMap?] in value.map { (value: SubjectNote?) -> ResultMap? in value.flatMap { (value: SubjectNote) -> ResultMap in value.resultMap } } }, forKey: "subjectNotes")
      }
    }

    public struct SubjectNote: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SubjectNote"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("date", type: .nonNull(.scalar(String.self))),
          GraphQLField("notes", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(date: String, notes: String) {
        self.init(unsafeResultMap: ["__typename": "SubjectNote", "date": date, "notes": notes])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var date: String {
        get {
          return resultMap["date"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date")
        }
      }

      public var notes: String {
        get {
          return resultMap["notes"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "notes")
        }
      }
    }
  }

  public struct Session: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Session"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(SessionItems.self),
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

      public var sessionItems: SessionItems {
        get {
          return SessionItems(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}
