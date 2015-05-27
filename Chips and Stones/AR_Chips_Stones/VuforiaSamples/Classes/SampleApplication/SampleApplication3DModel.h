
#import <Foundation/Foundation.h>

// this class reads a text file describing a 3d Model

@interface SampleApplication3DModel : NSObject
{
@private
    int m_nbVertices;
    NSString * m_path;
    float * m_vertices;
    float * m_normals;
    float * m_textcoords;
}

- (id)initWithTxtResourceName:(NSString *) name;

- (void) read ;

- (int) numVertices;
- (float *)vertices;
- (float *)normals;
- (float *)texCoords;
@end
