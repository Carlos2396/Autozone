<?php
	/*
		Clase que se encarga de realizar una conexión PDO a la base datos.
		Contiene las variables necesarias para la conexion.
	*/
	class Database {
		// Información necesaria para conectarse a la base de datos
		/*private static $dbName 			= 'usuario1' ; 
		private static $dbHost 			= 'localhost';
		private static $dbUsername 		= 'usuario1';
		private static $dbUserPassword 	= 'lU2CUQvJEd';*/

		private static $dbName 			= 'autozone' ; 
		private static $dbHost 			= 'localhost';
		private static $dbUsername 		= 'admin';
		private static $dbUserPassword 	= 'admin';
		
		private static $cont  = null;
		
		public function __construct() {
			exit('Init function is not allowed');
		}
		
		public static function connect(){
		   // One connection through whole application
	    	if ( null == self::$cont ) {      
		    	try {
		        	self::$cont =  new PDO( "mysql:host=".self::$dbHost.";"."dbname=".self::$dbName, self::$dbUsername, self::$dbUserPassword);  
					self::$cont->exec("set names utf8");
				}
		        catch(PDOException $e) {
		        	die($e->getMessage());  
				}
	       	} 
	       	return self::$cont;
		}
		
		public static function disconnect() {
			self::$cont = null;
		}
	}
?>