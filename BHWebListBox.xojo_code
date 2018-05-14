#tag Class
Protected Class BHWebListBox
Inherits WebListbox
	#tag Method, Flags = &h0
		Sub AddRow(pRowTag as Variant, pItems() As String)
		  Me.AddRow()
		  
		  Me.RowTag(me.LastIndex) = pRowTag
		  Me.Row(me.LastIndex, pItems)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRow(pRowTag as Variant, ParamArray pItems as String)
		  me.AddRow(pRowTag, pItems)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Columns() As String()
		  if Columns.Ubound <> -1 then return Columns
		  
		  dim ColumnsHeaderName() as string
		  if me.HasHeading = true then
		    For pCol As Integer = 0 To Me.ColumnCount - 1
		      ColumnsHeaderName.Append(me.Heading(pCol))
		    Next
		  else
		    For pCol As Integer = 0 To Me.ColumnCount - 1
		      ColumnsHeaderName.Append(pCol.StringValue)
		    Next
		  end if
		  
		  Columns = ColumnsHeaderName
		  Return ColumnsHeaderName()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Find(pString as String, pColumn as Integer) As Integer
		  For pRow As Integer = 0 To Me.RowCount - 1
		    If pString = Me.Cell(pRow, pColumn) Then
		      Return pRow
		    End If
		  Next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Find(pString as String, pColumn as Integer, pExact as Boolean) As Integer
		  For pRow As Integer = 0 To Me.RowCount - 1
		    If pString.Contains(Me.Cell(pRow, pColumn)) Then
		      Return pRow
		    End If
		  Next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Find(pTag as Variant) As Integer
		  For pRow As Integer = 0 To Me.RowCount - 1
		    If pTag = Me.RowTag(pRow) Then
		      Return pRow
		    End If
		  Next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Row(pRow As Integer) As String()
		  Dim pValues() As String
		  
		  For pColumn As Integer = 0 To Me.ColumnCount - 1
		    pValues.Append(Me.Cell(pRow, pColumn))
		  Next
		  
		  Return pValues
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Row(pRow As Integer, pValues() As String)
		  For pColumn As Integer = 0 To pValues.UBound
		    Me.Cell(pRow, pColumn) = pValues(pColumn)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Row(pRow As Integer, ParamArray pValues As String)
		  Me.Row(pRow, pValues)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Row(pRow As Integer, pTags() As Variant)
		  For pColumn As Integer = 0 To pTags.UBound
		    Me.CellTag(pRow, pColumn) = pTags(pColumn)
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Columns() As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AlternateRowColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cEDF3FE"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Behavior"
			InitialValue="*"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Cursor"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Automatic"
				"1 - Standard Pointer"
				"2 - Finger Pointer"
				"3 - IBeam"
				"4 - Wait"
				"5 - Help"
				"6 - Arrow All Directions"
				"7 - Arrow North"
				"8 - Arrow South"
				"9 - Arrow East"
				"10 - Arrow West"
				"11 - Arrow Northeast"
				"12 - Arrow Northwest"
				"13 - Arrow Southeast"
				"14 - Arrow Southwest"
				"15 - Splitter East West"
				"16 - Splitter North South"
				"17 - Progress"
				"18 - No Drop"
				"19 - Not Allowed"
				"20 - Vertical IBeam"
				"21 - Crosshair"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeading"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Behavior"
			InitialValue="200"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HorizontalCenter"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ListIndex"
			Visible=true
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockVertical"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinimumRowHeight"
			Visible=true
			Group="Behavior"
			InitialValue="22"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Multiline"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PrimaryRowColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cFFFFFF"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabOrder"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VerticalCenter"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Behavior"
			InitialValue="200"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZIndex"
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_DeclareLineRendered"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_HorizontalPercent"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_IsEmbedded"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Locked"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_NeedsRendering"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_OfficialControl"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_OpenEventFired"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_VerticalPercent"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
