abstract class Lab {
  String name;
  int colaboradores;
  List<String> projects = [];

  Lab(this.name, this.colaboradores, List<String> projects);

  getName() => this.name;

  getCollaborators() => this.colaboradores;

  getProjects() => this.projects;

  setUpdateName(String name) {
    return this.name = name;
  }

  setUpdateCollaboradores(int collaboradores) {
    return this.colaboradores = colaboradores;
  }

  setUpdateProjects(List<String> projects) {
    return this.projects = projects;
  }

  SetPutProjects(String proje) {
    this.projects.add(proje);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Lab{name: $name, colaboradores: $colaboradores, projects: ${projects.join(', ')}}';
  }
}

class LabContructor extends Lab {
  LabContructor(String name, int colaboradores, List<String> project)
      : super(name, colaboradores, project);
}

void main(List<String> args) {
  var labican = LabContructor(
      "Labican", 30, ['TI nas escolas', 'Pensamento computacional']);
  print(labican);
}
