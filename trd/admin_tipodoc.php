<?php
/**
 * En este frame se van cargado cada una de las funcionalidades del sistema
 *
 * Descripcion Larga
 *
 * @category
 * @package      SGD Orfeo
 * @subpackage   Main
 * @author       Community
 * @author       Skina Technologies SAS (http://www.skinatech.com)
 * @license      GNU/GPL <http://www.gnu.org/licenses/gpl-2.0.html>
 * @link         http://www.orfeolibre.org
 * @version      SVN: $Id$
 * @since
 */

        /*---------------------------------------------------------+
        |                     INCLUDES                             |
        +---------------------------------------------------------*/


        /*---------------------------------------------------------+
        |                    DEFINICIONES                          |
        +---------------------------------------------------------*/


        /*---------------------------------------------------------+
        |                       MAIN                               |
        +---------------------------------------------------------*/


session_start();
foreach ($_GET as $key => $valor)
    ${$key} = $valor;
foreach ($_POST as $key => $valor)
    ${$key} = $valor;
$krd = $_SESSION["krd"];
$dependencia = $_SESSION["dependencia"];
$usua_doc = $_SESSION["usua_doc"];
$codusuario = $_SESSION["codusuario"];
$ruta_raiz = "..";
include_once("$ruta_raiz/include/db/ConnectionHandler.php");
$db = new ConnectionHandler("$ruta_raiz");
if (!defined('ADODB_FETCH_ASSOC'))
    define('ADODB_FETCH_ASSOC', 2);
$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC;
if (!isset($terminot))
    $terminot = "";
if (!isset($codusua))
    $codusua = "";
if (!isset($depende))
    $depende = "";
if (!isset($ent))
    $ent = "";
$encabezadol = $_SERVER['PHP_SELF'] . "?terminot=$terminot&codusua=$codusua&depende=$depende&ent=$ent";
include ("$ruta_raiz/busqueda/common.php");
//$db->conn->debug = true;
// Genera dinamicamente los tipos de radicado
$sql = "SELECT SGD_TRAD_CODIGO,SGD_TRAD_DESCR FROM SGD_TRAD_TIPORAD ORDER BY SGD_TRAD_CODIGO";
$ADODB_COUNTRECS = true;
$rs_trad = $db->query($sql);
if ($rs_trad->RecordCount() >= 0) {
    $i = 0;
    $cad = "perm_tp";
    $tipos = "<table width='100%'><tr><td height='26' class='listado2' width='100%'>";
    $cmp = "SGD_TPR_TP";
    while ($arr = $rs_trad->FetchRow()) {
        $tipos .= "&nbsp;<label for=" . $cad . $arr['SGD_TRAD_CODIGO'] . ">" . $arr['SGD_TRAD_DESCR'] . "</label><input type='checkbox' name='" . $cad . $arr['SGD_TRAD_CODIGO'] . "' id='" . $cad . $arr['SGD_TRAD_CODIGO'] . "' value=1 title='Active la casilla para indicar el tipo o tipos de documento' >" . "&nbsp"; //"&nbsp;".$arr['SGD_TRAD_DESCR']."&nbsp;&nbsp;";
        $ins_cmp .= $cmp . $arr['SGD_TRAD_CODIGO'] . ",";
        (isset($_POST[$cad . $arr['SGD_TRAD_CODIGO']])) ? $ins_vlr .= "1," : $ins_vlr .= "0,";
        (isset($_POST[$cad . $arr['SGD_TRAD_CODIGO']])) ? $vlr = "1" : $vlr = "0";

        $matriz[$i] = strtoupper($arr['SGD_TRAD_DESCR']);
        $matriz1[$i] = $cmp . $arr['SGD_TRAD_CODIGO'];
        $matriz2[$i] = $vlr;
        $i += 1;
    }
    $ins_cmp = substr($ins_cmp, 0, strlen($ins_cmp) - 1);
    $ins_vlr = substr($ins_vlr, 0, strlen($ins_vlr) - 1);
    $tipos .= "</td></tr></table>";
} else
    $tipos .= "<tr><td align='center'> No se han gestionado tipos de radicados</td></tr></table>";
$ADODB_COUNTRECS = false;
?>
<html>
    <head>
        <title>Tipos documentales</title>
        <link href="<?= $ruta_raiz . $ESTILOS_PATH2 ?>bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="<?= $ruta_raiz . $_SESSION['ESTILOS_PATH_ORFEO'] ?>">
        <script type="text/javascript">
            function regresar() {
                document.adm_tipodoc.submit();
            }
        </script>
    </head>
    <body bgcolor="#FFFFFF">
        <div id="spiffycalendar" class="text"></div>
        <!--<table class=borde_tab width='100%' cellspacing="1"><tr><td class=titulos2><center>TIPOS DOCUMENTALES</center></td></tr></table>-->
        <br>
        <form method="post" action="<?= $encabezadol ?>" name="adm_tipodoc"> 
            <table width="80%" class="borde_tab" cellspacing="1" border="1" align="center">
                <tr>
                <div id="titulo" style="width: 80%; margin-left: 10%;" align="center">Tipos documentales</div>
                </tr>
                <?
                if ($_POST['actua_tdoc']) {
                    ?>
                    <tr>
                        <td width="125" height="21"  class='titulos2'> C&oacute;digo<br> </td>
                        <td valign="top" align="left" class='listado2'>
                            <input type=text name=codtdocI value='<?= $codtdocI ?>' class='tex_area' size=11 maxlength="7" >
                        </td>
                        <td height="21"><input type=submit name=modi_tdoc Value='Grabar Modificacion' class=botones_largo ></td>
                    </tr>
                    <?
                }
                ?>
                <tr>
                    <td height="26" width="30%" class='titulos2'><label for="detatipod"> Descripción</label></td>
                    <td valign="top" align="left" class='listado2'>
                        <input type=text name=detatipod value='<?= $detatipod ?>' id="detatipod" class='tex_area' size=50 maxlength="75" title="Descripción del tipo documental">
                    </td>
                </tr>
                <tr> 
                    <td height="26"  width="30%" class='titulos2'><label for="terminot">Término trámite</label><br></td>
                    <td valign="top" align="left" class='listado2'>
                        <input type=text name=terminot id="terminot" value='<?= $terminot ?>' class='tex_area' size=2 maxlength="2" title="Ingrese el número de días en que termina el trámite">
                    </td>
                </tr>
                <tr> 
                    <td class="titulos2" colspan="2" width="100%">Seleccione el tipo de radicado</td>
                </tr>
                <tr>
                    <td align="left" colspan="2" class="listado2">
                        <?php
                        echo $tipos;
                        ?>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2" class="listado2">
                         <input type='checkbox' name='tpRadica' id='tpRadica'
                        <?
                        if ($tpRadica) {
                            echo " checked ";
                            $tpRadica = '1';
                        } else {
                            $tpRadica = '0';
                        }
                        ?> 
                        <label for="tpRadica">&nbsp;Este Tipo se Puede Seleccionar Desde el Formulario de Radicacion sin TRD (Temporal...)</label>
                        
                    </td>   
                </tr>
                <tr>
                    <td height="26" colspan="5" valign="top" class='listado1' align="center">
                <center>
                    <input type=submit name=buscar_dcto Value='Buscar' class=botones aria-label="Buscar tipos documentales por criterios ingresados">
                    <input type=submit name=insertar_tdoc Value='Insertar' class=botones aria-label="Insertar nueva TRD">
                    <input type=submit name=actua_tdoc Value='Modificar' class=botones aria-label="Editar TRD existente">
                    <input type="reset"  name=aceptar class=botones id=envia22  value='Cancelar' aria-label="Salir sin hacer nada">
                </center>
                </td>
                </tr>
            </table>
            <?PHP
            $whereBusqueda = "";
            if ($buscar_dcto && $detatipod != '') {
                $whereBusqueda = " where upper(sgd_tpr_descrip) like upper('%$detatipod%')";
            }

//Insertar Datos Tpo Documental
            if ($terminot == '') {
                $terminot = 0;
            }
            if ($_POST['insertar_tdoc'] && $detatipod != '') {
                $isqlB = "select * from sgd_tpr_tpdcumento where upper(rtrim(sgd_tpr_descrip)) = '$detatipod' ";
                # Selecciona el registro a actualizar
                $rs = $db->query($isqlB); # Executa la busqueda y obtiene el registro a actualizar.
                $radiNumero = $rs->fields["SGD_TPR_CODIGO"];
                if ($radiNumero != '') {
                    $mensaje_err = "<HR><center><B><FONT COLOR=RED>El Tipo Documento < $radiNumero $detatipod > YA EXISTE. <BR>  VERIFIQUE LA INFORMACION E INTENTE DE NUEVO</FONT></B></center><HR>";
                } else {
                    $isql = "select max(sgd_tpr_codigo) as NUME from sgd_tpr_tpdcumento";
                    $rs = $db->query($isql); # Executa la busqueda y obtiene el Codigo del documento.
                    $radiNumero = $rs->fields["NUME"];
                    $radiNumero = $radiNumero + 1;
                    $query = "insert into SGD_TPR_TPDCUMENTO(SGD_TPR_CODIGO, SGD_TPR_DESCRIP,SGD_TPR_TERMINO," . $ins_cmp . ",SGD_TPR_RADICA)" .
                            "VALUES ('$radiNumero','$detatipod','$terminot'," . $ins_vlr . "," . $tpRadica . ")";

                    $rsIN = $db->conn->query($query);
                    if ($rsIN)
                        $mensaje_err = "<HR><center><B><FONT COLOR=RED>Tipo Documental Creado<FONT></B></center><HR>";
                    else
                        $mensaje_err = "<HR><center><B><FONT COLOR=RED>Error al crear Tipo Documental</FONT></B></center><HR>";
                    $terminot = '';
                    $detatipod = '';
                    ?><script type="text/javascript" language="javascript">
                        document.adm_tipodoc.detatipod.value = '';
                        document.adm_tipodoc.terminot.value = '';
                    </script>
                    <?
                }
            }
//Modificacion Datos Tipo Documental
            if ($_POST['modi_tdoc'] && ($detatipod != '') && ($codtdocI != 0)) {
                $isqlB = "select * from sgd_tpr_tpdcumento where upper(rtrim(sgd_tpr_descrip)) = '$detatipod' and sgd_tpr_codigo != $codtdocI";
                # Selecciona el registro a actualizar
                $rs = $db->query($isqlB); # Executa la busqueda y obtiene el registro a actualizar.
                $radiNumero = $rs->fields["SGD_TPR_CODIGO"];
                if ($radiNumero != '') {
                    $mensaje_err = "<HR><center><B><FONT COLOR=RED>El Tipo Documento < $detatipod > YA EXISTE PARA EL C&Oacute;DIGO < $radiNumero > <BR>  VERIFIQUE LA INFORMACION E INTENTE DE NUEVO</FONT></B></center><HR>";
                } else {
                    $conteo = count($matriz);
                    for ($j = 0; $j < $conteo; $j++) {
                        $cadena .= $matriz1[$j] . "=" . $matriz2[$j] . ",";
                    }

                    $query = "update SGD_TPR_TPDCUMENTO set SGD_TPR_DESCRIP ='$detatipod',$cadena
		SGD_TPR_TERMINO = '$terminot'
		, SGD_TERMINO_REAL = '$terminot'
		,sgd_tpr_radica=$tpRadica  
		where  sgd_tpr_codigo = $codtdocI ";
                    //$db->conn->debug = true;
                    $rsIN = $db->conn->query($query);
                    $terminot = '';
                    $detatipod = '';
                    $cadena = '';
                    $mensaje_err = "<HR><center><B><FONT COLOR=RED>SE MODIFIC&Oacute; EL TIPO DOCUMENTAL</FONT></B></center><HR>";
                    ?><script type="text/javascript" language="javascript">
                        document.adm_tipodoc.detatipod.value = '';
                        document.adm_tipodoc.terminot.value = '';
                    </script>
                    <?
                }
            }
            echo $mensaje_err;
            include_once "$ruta_raiz/trd/lista_tiposdocu.php";
            ?>
        </form>
        <p>
            <?= $mensaje_err ?>
        </p>
    </body>
</html>
