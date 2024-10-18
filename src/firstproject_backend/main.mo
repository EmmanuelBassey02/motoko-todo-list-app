import Buf "mo:base/Buffer"

actor MyList{

  type ToDo = {
    id: Nat;
    description: Text;
    complete: Bool;
  };

  var newid: Nat = 0;
  let tracker: Buf.Buffer<ToDo> = Buf.Buffer<ToDo>(100);

  public func addTask(_description: Text) {
    tracker.add({
      id= newid;
      description= _description;
      complete= false;
    });

    newid := newid + 1;

  };

  public query func displayTasks(): async Text {
    var output: Text ="\n My Tasks: ";
    for (task: ToDo in tracker.vals()){
      output #= "\n" # task.description;
    }; 

    return output # "\n";
  }
};