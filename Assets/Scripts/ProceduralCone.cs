using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class ProceduralCone : MonoBehaviour
{
    public float botRadius, topRadius;
    public float height;
    [Range(3,100)]
    public int edges;

    public MeshFilter filter;

    private Mesh _mesh;

    public List<Vector3> vertices = new List<Vector3>();
    private List<int> triangles = new List<int>();
    private List<Vector3> normals = new List<Vector3>();
    private List<Vector2> uvs = new List<Vector2>();

    private void Update()
    {
        if (Application.isPlaying) return;
        if (filter == null) return;
        if (_mesh == null)
        {
            if (filter.mesh == null)
                _mesh = new Mesh();
            else
                _mesh = filter.mesh;
        }
        if (filter.sharedMesh == null)
            filter.sharedMesh = _mesh;

        vertices.Clear();
        triangles.Clear();
        normals.Clear();
        uvs.Clear();

        float angle = 0f;
        Vector3 vertPos;

        //VERTS
        float angleIncr = (Mathf.PI * 2f) / edges;
        float topBotDiff = topRadius - botRadius;
        float iIncr = 1f / (float)edges;
        for (int i = 0; i < edges; i++)
        {
            vertPos = new Vector3(Mathf.Sin(angle) * botRadius, 0f, Mathf.Cos(angle) * botRadius) ;
            vertices.Add(vertPos);
            normals.Add(vertPos.normalized);
            uvs.Add(new Vector2((float)i * iIncr, 0));
            angle -= angleIncr;
        }

        angle = 0f;
        for (int i = 0; i < edges; i++)
        {
            vertPos = new Vector3(Mathf.Sin(angle) * topRadius, height, Mathf.Cos(angle) * topRadius);
            vertices.Add(vertPos);
            normals.Add(vertPos.normalized);
            uvs.Add(new Vector2((float)i * iIncr, 1f));
            angle -= angleIncr;
        }


        //TRIS
        for (int i = 0; i < edges; i++)
        {
            triangles.Add(i);           // 0 // 1 // 2 // 3
            triangles.Add(i + edges);   // 4 // 5 // 6 // 7
            triangles.Add((i + 1) % edges);       // 1 // 2 // 3 // 4

            triangles.Add(i + edges);                           // 4 // 5 // 6 // 7
            triangles.Add(((i + edges + 1) % edges) + edges);   // 5 // 6 // 7 // ?
            triangles.Add((i + 1) % edges);                     // 1 // 2 // 3 // ?
        }

        
        _mesh.Clear();
        _mesh.SetVertices(vertices);
        _mesh.SetTriangles(triangles, 0);
        _mesh.SetUVs(0, uvs);
        //_mesh.SetNormals(normals);
        _mesh.RecalculateNormals();
    }
}
