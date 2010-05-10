require 'rake/clean'

ERLC_FLAGS = "-Iinclude +warn_unused_vars +warn_unused_import"

SRC = FileList['src/*.erl']
OBJ = SRC.pathmap("%{src,ebin}X.beam")
TEST = FileList['test/*.erl']
TEST_OBJ = TEST.pathmap("%{test,ebin}X.beam")

CLEAN.include("ebin/*.beam")

rule ".beam" => ["%{ebin,src}X.erl"] do |t|
  sh "erlc -D EUNIT -pa ebin -W #{ERLC_FLAGS} -o ebin #{t.source}"
end

rule ".beam" => ["%{ebin,test}X.erl"] do |t|
  sh "erlc -D EUNIT -pa ebin -W #{ERLC_FLAGS} -o ebin #{t.source}"
end

task :compile => ['ebin'] + OBJ

task :compile_tests => ['ebin'] + TEST_OBJ

task :default => :compile

task :test => [:compile, :compile_tests] do
  sh "erl -pa ebin -run all_tests run -run init stop"
end

task :play => [:compile] do 
  sh "erl -pa ebin -run game play -run init stop"
end