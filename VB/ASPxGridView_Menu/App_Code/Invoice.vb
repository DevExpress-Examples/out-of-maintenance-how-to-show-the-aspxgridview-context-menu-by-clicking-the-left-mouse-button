Imports System
Imports System.Collections.Generic

<Serializable> _
Public Class Invoice
    Implements IEquatable(Of Invoice)


    Private id_Renamed As Integer

    Public Property Id() As Integer
        Get
            Return id_Renamed
        End Get
        Set(ByVal value As Integer)
            id_Renamed = value
        End Set
    End Property

    Private description_Renamed As String

    Public Property Description() As String
        Get
            Return description_Renamed
        End Get
        Set(ByVal value As String)
            description_Renamed = value
        End Set
    End Property

    Private price_Renamed As Decimal

    Public Property Price() As Decimal
        Get
            Return price_Renamed
        End Get
        Set(ByVal value As Decimal)
            price_Renamed = value
        End Set
    End Property

    Public Sub New(ByVal id As Integer, ByVal description As String, ByVal price As Decimal)
        Me.Id = id
        Me.Description = description
        Me.Price = price
    End Sub
    Public Sub New()

    End Sub
    Public Function Equals(ByVal other As Invoice) As Boolean Implements IEquatable(Of Invoice).Equals
        Return Me.Id.Equals(other.Id)
    End Function
End Class