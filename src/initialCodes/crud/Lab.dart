class Lab {
  String name;
  int collaborators;
  List<String> projects = [];

  Lab(this.name, this.collaborators, List<String> this.projects);

  getName() => this.name;

  getCollaborators() => this.collaborators;

  getProjects() => this.projects;

  setUpdateName(String name) {
    return this.name = name;
  }

  setUpdateCollaboradores(int collaboradores) {
    return this.collaborators = collaborators;
  }

  setUpdateProjects(List<String> projects) {
    return this.projects = projects;
  }

  setPutProjects(String proje) {
    this.projects.add(proje);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Lab{name: $name, collaborators: $collaborators, projects: ${projects.join(', ')}}';
  }
}

void main(List<String> args) {
  var labican = Lab(
      "Labican", 30, ['TI nas escolas', 'Pensamento computacional']);
  print(labican);
}
