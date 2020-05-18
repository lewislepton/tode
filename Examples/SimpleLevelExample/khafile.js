let project = new Project('Project');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('tode');
project.addLibrary('nape-haxe4');
resolve(project);