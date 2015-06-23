class { 'tomcat': }

tomcat::instance { 'tomcatinstance1':
  catalina_base => '/opt/apache-tomcat/tomcatinstance1',
  source_url    => 'http://www.gtlib.gatech.edu/pub/apache/tomcat/tomcat-8/v8.0.23/bin/apache-tomcat-8.0.23.tar.gz'
}->
tomcat::service { 'instance1default':
  catalina_base => '/opt/apache-tomcat/tomcatinstance1',
}->
tomcat::config::server { 'tomcatinstance1':
  catalina_base => '/opt/apache-tomcat/tomcatinstance1',
  port          => '8001',
}->
tomcat::config::server::connector { 'tomcatinstance1http':
  catalina_base         => '/opt/apache-tomcat/tomcatinstance1',
  port                  => '8002',
  protocol              => 'HTTP/1.1',
  additional_attributes => {
    'redirectPort' => '8003'
  },
}->
tomcat::config::server::connector { 'tomcatinstance1ajp':
  catalina_base         => '/opt/apache-tomcat/tomcatinstance1',
  port                  => '8004',
  protocol              => 'AJP/1.3',
  additional_attributes => {
    'redirectPort' => '8003'
  },
}->

tomcat::instance { 'tomcatinstance2':
  catalina_base => '/opt/apache-tomcat/tomcatinstance2',
  source_url    => 'http://www.gtlib.gatech.edu/pub/apache/tomcat/tomcat-8/v8.0.23/bin/apache-tomcat-8.0.23.tar.gz'
}->
tomcat::service { 'default':
  catalina_base => '/opt/apache-tomcat/tomcatinstance2',
}->
tomcat::config::server { 'tomcatinstance2':
  catalina_base => '/opt/apache-tomcat/tomcatinstance2',
  port          => '8005',
}->
tomcat::config::server::connector { 'tomcatinstance2http':
  catalina_base         => '/opt/apache-tomcat/tomcatinstance2',
  port                  => '8006',
  protocol              => 'HTTP/1.1',
  additional_attributes => {
    'redirectPort' => '8007'
  },
}->
tomcat::config::server::connector { 'tomcatinstance2ajp':
  catalina_base         => '/opt/apache-tomcat/tomcatinstance2',
  port                  => '8008',
  protocol              => 'AJP/1.3',
  additional_attributes => {
    'redirectPort' => '8007'
  },
}