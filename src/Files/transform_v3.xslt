<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:cim="http://iec.ch/TC57/2009/CIM-schema-cim14#"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">

    <xsl:output method="xml" indent="yes"/>

    <!-- Identity transform to copy unchanged content -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Transform DistributionSystem -->
    <xsl:template match="DistributionSystem">
        <rdf:RDF>
            <xsl:apply-templates select="Substation"/>
        </rdf:RDF>
    </xsl:template>

    <!-- Transform Substation -->
    <xsl:template match="Substation">
        <cim:Substation rdf:ID="{Id}">
            <cim:IdentifiedObject_name><xsl:value-of select="Name"/></cim:IdentifiedObject_name>
            <cim:Substation_PermitAreaId><xsl:value-of select="PermitAreaId"/></cim:Substation_PermitAreaId>
            <cim:Substation_Impedance_R0><xsl:value-of select="Impedance_R0"/></cim:Substation_Impedance_R0>
            <cim:Substation_Impedance_XB><xsl:value-of select="Impedance_XB"/></cim:Substation_Impedance_XB>
            <cim:Substation_Impedance_R1><xsl:value-of select="Impedance_R1"/></cim:Substation_Impedance_R1>
            <cim:Substation_Impedance_X1><xsl:value-of select="Impedance_X1"/></cim:Substation_Impedance_X1>
            <cim:Substation_Impedance_R2><xsl:value-of select="Impedance_R2"/></cim:Substation_Impedance_R2>
            <cim:Substation_Impedance_X2><xsl:value-of select="Impedance_X2"/></cim:Substation_Impedance_X2>
        </cim:Substation>
        <!-- Transform nested elements -->
        <xsl:apply-templates select="Switch"/>
        <xsl:apply-templates select="Breaker"/>
        <xsl:apply-templates select="Bus"/>
    </xsl:template>

    <!-- Transform Switch -->
    <xsl:template match="Switch">
        <cim:Switch rdf:ID="{Id}">
            <cim:IdentifiedObject_name><xsl:value-of select="Name"/></cim:IdentifiedObject_name>
            <cim:Switch_FromNode rdf:resource="{FromNode}"/>
            <cim:Switch_ToNode rdf:resource="{ToNode}"/>
            <cim:Switch_Phase><xsl:value-of select="Phase"/></cim:Switch_Phase>
            <cim:Switch_NormallyOpen><xsl:value-of select="NormallyOpen"/></cim:Switch_NormallyOpen>
            <cim:Switch_ComputeFlows><xsl:value-of select="ComputeFlows"/></cim:Switch_ComputeFlows>
        </cim:Switch>
    </xsl:template>

    <!-- Transform Breaker -->
    <xsl:template match="Breaker">
        <cim:Breaker rdf:ID="{Id}">
            <cim:IdentifiedObject_name><xsl:value-of select="Name"/></cim:IdentifiedObject_name>
            <cim:Breaker_FromNode rdf:resource="{FromNode}"/>
            <cim:Breaker_ToNode rdf:resource="{ToNode}"/>
            <cim:Breaker_Phase><xsl:value-of select="Phase"/></cim:Breaker_Phase>
            <cim:Breaker_LabelPlacement>
                <cim:LabelPlacement_X><xsl:value-of select="LabelPlacement/X"/></cim:LabelPlacement_X>
                <cim:LabelPlacement_Y><xsl:value-of select="LabelPlacement/Y"/></cim:LabelPlacement_Y>
            </cim:Breaker_LabelPlacement>
            <cim:Breaker_NormallyOpen><xsl:value-of select="NormallyOpen"/></cim:Breaker_NormallyOpen>
            <cim:Breaker_ComputeFlows><xsl:value-of select="ComputeFlows"/></cim:Breaker_ComputeFlows>
        </cim:Breaker>
    </xsl:template>

    <!-- Transform Bus -->
    <xsl:template match="Bus">
        <cim:Bus rdf:ID="{Id}">
            <cim:IdentifiedObject_name><xsl:value-of select="Name"/></cim:IdentifiedObject_name>
            <cim:Bus_Node rdf:resource="{Node}"/>
            <cim:Bus_VoltUnit><xsl:value-of select="VoltUnit"/></cim:Bus_VoltUnit>
            <cim:Bus_SymbolPlacement>
                <cim:SymbolPlacement_X><xsl:value-of select="SymbolPlacement/Vertex/X[1]"/></cim:SymbolPlacement_X>
                <cim:SymbolPlacement_Y><xsl:value-of select="SymbolPlacement/Vertex/Y[1]"/></cim:SymbolPlacement_Y>
            </cim:Bus_SymbolPlacement>
        </cim:Bus>
    </xsl:template>

</xsl:stylesheet>
